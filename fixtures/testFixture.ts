// base comes from playwright-bdd, not '@playwright/test' directly — createBdd() in
// step-definitions/** requires the test it's bound to to originate here, or it throws.
import { test as base } from 'playwright-bdd';
import { logger } from '../utils/logger';
import { NetworkLogger } from '../utils/networkHelper';
import { ConsoleLogger } from '../utils/consoleHelper';

/**
 * Register one fixture per Page Object here as you add them under `pages/` — add its type
 * to `Fixtures` and its factory alongside `testLifecycle` below, e.g.:
 *
 * ```ts
 * loginPage: async ({ page }, use) => {
 *   await use(new LoginPage(page));
 * },
 * ```
 *
 * Step definitions then receive it directly: `When('...', async ({ loginPage }) => ...)`.
 */
type Fixtures = {
  testLifecycle: void;
};

export const test = base.extend<Fixtures>({
  // Auto fixture rather than beforeEach/afterEach hooks: bddgen-generated specs never call
  // a hook-registration function, so per-test logging and listeners have to attach themselves.
  testLifecycle: [async ({ page }, use, testInfo) => {
    logger.execution.testStart(testInfo.title);

    // Only force the desktop viewport on desktop projects — mobile-chrome's Pixel 5
    // emulated viewport must not be clobbered.
    if (!testInfo.project.use.isMobile) {
      await page.setViewportSize({ width: 1440, height: 900 });
    }

    page.on('request', NetworkLogger.onRequest);
    page.on('response', (response) => {
      NetworkLogger.onResponse(response);
      // 3xx redirects are normal navigation, not failures — only 4xx/5xx count.
      if (response.status() >= 400) {
        NetworkLogger.onFailedResponse(response);
      }
    });
    page.on('console', ConsoleLogger.handleMessage);
    page.on('pageerror', ConsoleLogger.handlePageError);

    await use();

    const status = testInfo.status;
    if (status !== testInfo.expectedStatus) {
      logger.error.assertion(`Test ${testInfo.title} failed with status ${status}`);
    }
    logger.execution.testEnd(`${testInfo.title} - Status: ${status}`);
    logger.application.testExecution(`Test ${testInfo.title} completed with status ${status}`);
  }, { auto: true }],
});

export { expect } from '@playwright/test';

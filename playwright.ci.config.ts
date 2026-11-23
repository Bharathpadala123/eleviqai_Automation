import { defineConfig } from '@playwright/test';
import base from './playwright.config';

/**
 * Config for the GitHub Actions run (.github/workflows/nightly-800.yml). Same tests, browser, timeouts and
 * rules as playwright.config.ts, with two differences:
 *
 * - Only the list log and the Excel/JSON rows are produced. The HTML, Ortoni, JUnit and JSON reports, traces,
 *   videos and screenshots are left out, because the repository is public and those files can hold the sign-in
 *   cookies (request logs of failed API calls) and the account's name (page snapshots).
 * - A run ends by itself after 170 minutes and still writes its report, so it never hits the job's time limit.
 */
export default defineConfig({
  ...base,
  globalTimeout: 170 * 60_000,
  reporter: [
    ['list'],
    ['./utils/finalRunReport.ts', { outputFolder: 'test-results/final-report', checkpointEvery: 5, rowsFile: 'rows.json' }],
  ],
  use: {
    ...base.use,
    trace: 'off',
    video: 'off',
    screenshot: 'off',
  },
});

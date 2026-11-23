import { defineConfig, devices } from '@playwright/test';
import { defineBddConfig } from 'playwright-bdd';
import { OrtoniReportConfig } from 'ortoni-report';
import dotenv from 'dotenv';
import path from 'path';
import * as os from 'os';
import { NetworkLogger } from './utils/networkHelper';
import { ConsoleLogger } from './utils/consoleHelper';
import { ExecutionLogger } from './utils/executionHelper';
import { logger } from './utils/logger';

dotenv.config({ path: path.resolve(__dirname, '.env'), quiet: true });

// UI test cases are authored as Gherkin (`features/**`) + step definitions
// (`step-definitions/**`), compiled by `bddgen` into Playwright specs under
// `bddTestDir` — see skills/testroid-bdd-conventions/SKILL.md.
const bddTestDir = defineBddConfig({
  features: 'features/**/*.feature',
  // testFixture.ts is listed so bddgen can find the extended `test` that generated specs import.
  steps: ['fixtures/testFixture.ts', 'step-definitions/**/*.ts'],
  outputDir: '.features-gen',
});

const ortoniReportConfig: OrtoniReportConfig = {
  // 'never' here — ortoni-report's own 'always'/'on-failure' spins up an Express server in
  // onExit() that blocks forever awaiting Ctrl+C. OrtoniAutoOpenReporter below pops the
  // generated file open without holding the process, so `npm test` still exits normally.
  open: 'never',
  folderPath: 'ortoni-report',
  filename: 'index.html',
  title: 'Ortoni Test Report',
  projectName: 'Playwright AI Framework',
  testType: 'Functional',
  authorName: os.userInfo().username,
  base64Image: false,
  stdIO: false,
  meta: {
    'Test Cycle': 'Feb, 2026',
    version: '4',
    description: 'My automation suite',
    release: '0.6',
    platform: os.type(),
  },
};

const toNumber = (value: string | undefined, fallback: number): number => {
  const parsed = Number(value);
  return Number.isFinite(parsed) ? parsed : fallback;
};

const toBoolean = (value: string | undefined, fallback: boolean): boolean => {
  if (value === undefined) {
    return fallback;
  }
  return ['1', 'true', 'yes', 'on'].includes(value.toLowerCase());
};

const baseURL = process.env.BASE_URL ?? 'http://localhost:3000';
const headless = toBoolean(process.env.HEADLESS, true);
const slowMo = toNumber(process.env.SLOW_MO, 0);
const timeout = toNumber(process.env.TIMEOUT, 30000);
const retries = toNumber(process.env.RETRIES, 0);
const workers = toNumber(process.env.WORKERS, 1);

export default defineConfig({
  testDir: bddTestDir,
  fullyParallel: false,
  forbidOnly: !!process.env.CI,
  retries,
  workers,
  timeout,
  reporter: [
    ['list'],
    ['html', { outputFolder: 'playwright-report', open: 'never' }],
    ['junit', { outputFile: 'test-results/junit.xml' }],
    ['json', { outputFile: 'test-results/results.json' }],
    ['ortoni-report', {
      // 'never' — ortoni-report's own 'always'/'on-failure' would spin up a blocking
      // Express server; './utils/ortoniAutoOpenReporter.ts' below opens the generated
      // file without holding the process instead.
      open: 'never',
      folderPath: 'ortoni-report',
      filename: 'index.html',
      title: 'Ortoni Test Report',
    }],
    ['./utils/ortoniAutoOpenReporter.ts', { folderPath: 'ortoni-report', filename: 'index.html' }],
    // One-row-per-question Excel workbook (verdict, chat answer, why it failed, thumbs down), rewritten every
    // 25 scenarios during a long run: test-results/final-report/EleviqAI_Final_Report_latest.xlsx.
    ['./utils/finalRunReport.ts', { outputFolder: 'test-results/final-report', checkpointEvery: 25 }],
  ],
  outputDir: 'test-results/artifacts',
  use: {
    baseURL,
    headless,
    launchOptions: {
      slowMo,
    },
    trace: 'on-first-retry',
    video: 'retain-on-failure',
    screenshot: 'only-on-failure',
    storageState: process.env.STORAGE_STATE || undefined,
    actionTimeout: timeout,
    navigationTimeout: timeout,
    testIdAttribute: 'data-testid',
  },
  expect: {
    timeout,
  },
  projects: [
    {
      // testDir inherited from the root config (bddTestDir) — runs the Playwright
      // specs bddgen compiled from features/**/*.feature + step-definitions/**.
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
  ],
  globalSetup: require.resolve('./global-setup.ts'),
  globalTeardown: require.resolve('./global-teardown.ts'),
});

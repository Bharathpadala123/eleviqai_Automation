import path from 'path';
import winston from 'winston';

const logsDir = path.resolve(__dirname, '..', 'logs');

export type LogCategory = 'application' | 'debug' | 'error' | 'warning' | 'network' | 'api' | 'ui' | 'execution' | 'accessibility';

export const categories: Record<LogCategory, string> = {
  application: 'application',
  debug: 'debug',
  error: 'error',
  warning: 'warning',
  network: 'network',
  api: 'api',
  ui: 'ui',
  execution: 'execution',
  accessibility: 'accessibility',
};

export const categoryLoggers: Record<LogCategory, winston.Logger> = {} as Record<LogCategory, winston.Logger>;

// Network/API traffic is only written to logs/network.log and logs/api.log by default — it
// floods the terminal otherwise. Set LOG_NETWORK_CONSOLE=true in .env to echo it to the terminal.
// Failed (4xx/5xx) requests still reach the terminal through the error channel.
const FILE_ONLY_CATEGORIES: LogCategory[] = ['network', 'api'];
const logNetworkToConsole = ['1', 'true', 'yes', 'on'].includes((process.env.LOG_NETWORK_CONSOLE ?? '').toLowerCase());

for (const category of Object.keys(categories) as LogCategory[]) {
  const consoleSilent = FILE_ONLY_CATEGORIES.includes(category) && !logNetworkToConsole;
  categoryLoggers[category] = winston.createLogger({
    level: 'info',
    exitOnError: false,
    format: winston.format.combine(
      winston.format.timestamp(),
      winston.format.printf(({ timestamp, level, message }) => `${timestamp} [${level.toUpperCase()}] ${message}`)
    ),
    transports: [
      new winston.transports.Console({
        silent: consoleSilent,
        format: winston.format.combine(
          winston.format.timestamp(),
          winston.format.label({ label: category.toUpperCase() }),
          winston.format.colorize({ all: true }),
          winston.format.printf(({ timestamp, level, message, label }) => {
            const labelPart = label ? `[${label}]` : '';
            return `${timestamp} [${level.toUpperCase()}] ${labelPart} ${message}`;
          })
        ),
      }),
      new winston.transports.File({
        filename: path.join(logsDir, `${category}.log`),
        maxsize: 5 * 1024 * 1024,
        maxFiles: 5,
        tailable: true,
        format: winston.format.combine(
          winston.format.timestamp(),
          winston.format.printf(({ timestamp, level, message }) => `${timestamp} [${level.toUpperCase()}] ${message}`)
        ),
      }),
    ],
  });
}

const applicationLogger = categoryLoggers.application;
const debugLogger = categoryLoggers.debug;
const errorLogger = categoryLoggers.error;
const warningLogger = categoryLoggers.warning;
const networkLogger = categoryLoggers.network;
const apiLogger = categoryLoggers.api;
const uiLogger = categoryLoggers.ui;
const executionLogger = categoryLoggers.execution;
const accessibilityLogger = categoryLoggers.accessibility;

export const logger = {
  application: {
    startup: (message: string) => applicationLogger.info(`Framework startup: ${message}`),
    browser: (message: string) => applicationLogger.info(`Browser: ${message}`),
    testExecution: (message: string) => applicationLogger.info(`Test execution: ${message}`),
  },
  debug: {
    variable: (message: string) => debugLogger.debug(`Variable: ${message}`),
    locator: (message: string) => debugLogger.debug(`Locator: ${message}`),
    internal: (message: string) => debugLogger.debug(`Internal: ${message}`),
  },
  error: {
    exception: (message: string) => errorLogger.error(`Exception: ${message}`),
    assertion: (message: string) => errorLogger.error(`Assertion failed: ${message}`),
    timeout: (message: string) => errorLogger.error(`Timeout: ${message}`),
  },
  warning: {
    slowElement: (message: string) => warningLogger.warn(`Slow element: ${message}`),
    retry: (message: string) => warningLogger.warn(`Retry attempt: ${message}`),
    deprecated: (message: string) => warningLogger.warn(`Deprecated method: ${message}`),
    console: (message: string) => warningLogger.warn(`Browser console: ${message}`),
  },
  network: {
    request: (message: string) => networkLogger.info(`Request: ${message}`),
    response: (message: string) => networkLogger.info(`Response: ${message}`),
    status: (message: string) => networkLogger.info(`Status: ${message}`),
    failed: (message: string) => networkLogger.error(`Failed request: ${message}`),
  },
  api: {
    request: (message: string) => apiLogger.info(`Request: ${message}`),
    response: (message: string) => apiLogger.info(`Response: ${message}`),
    headers: (message: string) => apiLogger.info(`Headers: ${message}`),
    timing: (message: string) => apiLogger.info(`Timing: ${message}`),
  },
  ui: {
    click: (message: string) => uiLogger.info(`Click: ${message}`),
    fill: (message: string) => uiLogger.info(`Text entry: ${message}`),
    navigation: (message: string) => uiLogger.info(`Navigation: ${message}`),
    dropdown: (message: string) => uiLogger.info(`Dropdown: ${message}`),
    hover: (message: string) => uiLogger.info(`Hover: ${message}`),
    check: (message: string) => uiLogger.info(`Check: ${message}`),
  },
  execution: {
    testStart: (message: string) => executionLogger.info(`Test started: ${message}`),
    testEnd: (message: string) => executionLogger.info(`Test finished: ${message}`),
    browserInfo: (message: string) => executionLogger.info(`Browser: ${message}`),
    duration: (message: string) => executionLogger.info(`Duration: ${message}`),
    retry: (message: string) => executionLogger.info(`Retry: ${message}`),
    screenshot: (message: string) => executionLogger.info(`Screenshot: ${message}`),
    upload: (message: string) => executionLogger.info(`Upload: ${message}`),
    download: (message: string) => executionLogger.info(`Download: ${message}`),
  },
  accessibility: {
    scanStart: (message: string) => accessibilityLogger.info(`Scan started: ${message}`),
    violation: (message: string) => accessibilityLogger.warn(`Violation: ${message}`),
    clean: (message: string) => accessibilityLogger.info(`No violations: ${message}`),
    scanFailed: (message: string) => accessibilityLogger.error(`Scan failed: ${message}`),
  },
};

export type LoggerType = typeof logger;

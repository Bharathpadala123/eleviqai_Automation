import type { ConsoleMessage } from '@playwright/test';
import { logger } from '../utils/logger';
import { isFirstParty } from '../utils/networkHelper';

export class ConsoleLogger {
  static handleMessage(message: ConsoleMessage): void {
    const type = message.type();
    const text = message.text();
    const url = message.location()?.url ?? 'unknown';

    switch (type) {
      case 'error':
        // A third-party script/beacon that fails to load (e.g. Cloudflare Insights blocked by
        // DNS) is not an error in the app under test — keep it out of the error channel.
        if (text.startsWith('Failed to load resource') && url !== 'unknown' && !isFirstParty(url)) {
          logger.debug.internal(`Third-party resource failed [${url}]: ${text}`);
          break;
        }
        logger.error.exception(`Console error [${url}]: ${text}`);
        break;
      case 'warning':
        logger.warning.console(`Console warning [${url}]: ${text}`);
        break;
      default:
        logger.debug.internal(`Console ${type} [${url}]: ${text}`);
    }
  }

  static handlePageError(error: Error): void {
    logger.error.exception(`Page error: ${error.message}`);
  }
}

import type { Page } from '@playwright/test';

export type AriaRole = Parameters<Page['getByRole']>[0];

/**
 * One way to find an element. `BasePage.findElement` walks a `LocatorStrategyList`
 * in this order and returns the first strategy that actually resolves, so a page
 * keeps working even after a CSS class or DOM structure changes underneath it —
 * as long as one of the fallback strategies still matches.
 */
export type LocatorStrategy =
  | { kind: 'role'; role: AriaRole; name: string | RegExp }
  | { kind: 'label'; text: string | RegExp }
  | { kind: 'placeholder'; text: string | RegExp }
  | { kind: 'text'; text: string | RegExp }
  | { kind: 'testId'; testId: string }
  | { kind: 'css'; selector: string }
  | { kind: 'xpath'; selector: string };

export type LocatorStrategyList = readonly LocatorStrategy[];

/**
 * Site-specific locators go here, grouped by page/module, e.g.:
 *
 * ```ts
 * export const locatorConstants = {
 *   login: {
 *     usernameInput: [
 *       { kind: 'role', role: 'textbox', name: 'Username' },
 *       { kind: 'label', text: 'Username' },
 *       { kind: 'placeholder', text: 'Username' },
 *       { kind: 'css', selector: '#username' },
 *     ] as const,
 *     submitButton: (label: string): LocatorStrategyList => [
 *       { kind: 'role', role: 'button', name: label },
 *       { kind: 'text', text: label },
 *     ] as const,
 *   },
 * } as const;
 * ```
 *
 * Order strategies most-semantic-first, most-brittle-last (role/label/placeholder/text
 * → testId → css → xpath) — see `pages/BasePage.ts` for how the fallback walk works, and
 * the `testroid-locator-conventions` skill (`skills/testroid-locator-conventions/SKILL.md`)
 * for the full convention. A Page Object should never hold a raw CSS/XPath selector inline;
 * it belongs here as a `LocatorStrategyList` entry instead.
 */
export const locatorConstants = {
  /** EleviqAI chat (app.eleviqai.com). Strategies verified against the live signed-in page. */
  chat: {
    signedInIndicator: [
      { kind: 'role', role: 'button', name: 'Overview' },
      { kind: 'text', text: 'Overview' },
    ] as const,
    // Accessible name is "New chat" in the expanded sidebar and "New conversation" once a chat is open.
    newChatButton: [
      { kind: 'role', role: 'button', name: /new (chat|conversation)/i },
      { kind: 'text', text: 'New Chat' },
    ] as const,
    newChatHeading: [
      { kind: 'role', role: 'heading', name: 'Start a new chat' },
      { kind: 'text', text: 'Start a new chat' },
    ] as const,
    questionBox: [
      { kind: 'role', role: 'textbox', name: /Ask about your data/ },
      { kind: 'placeholder', text: /Ask about your data/ },
      { kind: 'css', selector: 'textarea' },
    ] as const,
    sendButton: [
      { kind: 'role', role: 'button', name: 'Send message' },
      { kind: 'css', selector: 'button.send-btn' },
    ] as const,
    // css first on purpose: the same question text also appears in the Recents sidebar, so a text
    // strategy would match the sidebar entry instead of the message in the conversation.
    userMessage: [
      { kind: 'css', selector: '.messages .user-row .user-bubble' },
    ] as const,
    botResponse: [
      { kind: 'css', selector: '.messages .bot-row' },
    ] as const,
    // Appears only once a response has finished rendering (the "Analysing…" indicator is gone).
    responseFeedback: [
      { kind: 'role', role: 'button', name: 'Good response' },
      { kind: 'css', selector: '.bot-row button.feedback-btn' },
    ] as const,
    // Thumbs down under a finished response (button title "Bad response", aria-pressed="true" once saved).
    // Clicking it only opens the "Tell us what went wrong" dialog; nothing is saved until a dialog button is pressed.
    badResponseButton: [
      { kind: 'role', role: 'button', name: 'Bad response' },
      { kind: 'css', selector: '.bot-row button.feedback-btn[title="Bad response"]' },
    ] as const,
    dislikeDialog: [
      { kind: 'text', text: 'Tell us what went wrong' },
      { kind: 'css', selector: '.dislike-modal' },
    ] as const,
    // "Ok" saves the thumbs down without a comment (POST /api/messages/{id}/dislike, comment null).
    // The dialog's other buttons are "Cancel" and "Send to EleviqAI", which stays disabled until a comment is typed.
    dislikeOkButton: [
      { kind: 'role', role: 'button', name: /^ok$/i },
      { kind: 'css', selector: '.dislike-modal button.dislike-btn:not(.ghost):not(.primary)' },
    ] as const,
  },
} as const;

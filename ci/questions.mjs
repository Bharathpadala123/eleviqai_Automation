// Prints the --grep pattern for one category job. MODE=all: the category's 100 regression questions; MODE=trial: the
// questions of TRIAL_QUESTIONS that belong to the category.
const category = process.env.CATEGORY ?? '';
if (!/^[A-Z]{3}$/.test(category)) throw new Error(`CATEGORY must be three capital letters, got "${category}"`);

if (process.env.MODE === 'all') {
  console.log(`(?=.*@regression\\b)(?=.*@${category}-\\d{3}\\b)`);
} else {
  const ids = (process.env.TRIAL_QUESTIONS ?? '').split(/[\s,]+/).filter((id) => /^[A-Z]{3}-\d{3}$/.test(id) && id.startsWith(`${category}-`));
  if (ids.length === 0) throw new Error(`TRIAL_QUESTIONS has no ${category} question`);
  console.log(`@(${ids.join('|')})\\b`);
}

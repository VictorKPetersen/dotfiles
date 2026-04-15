---
name: test-driven-development
description: Use when implementing any feature or bugfix, before writing implementation code
license: MIT
compatibility: opencode
metadata:
  category: "development-process"
  workflow: tdd
---

# Test-Driven Development (TDD)

## Overview

Write the test first. Watch it fail. Write minimal code to pass.

**Core principle:** If you didn't watch the test fail, you don't know if it tests the right thing.

## The Iron Law

```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

Write code before the test? Delete it. Start over. Do not keep it as "reference" — delete means delete.

## Red-Green-Refactor

### 1. RED — Write a Failing Test

Write one minimal test for the specific behavior you're implementing.

- One behavior per test
- Name describes the behavior
- Use real code, not mocks (unless unavoidable)

### 2. Verify RED — Watch It Fail

**MANDATORY. Never skip.**

Run the test and confirm:
- It fails (not errors out)
- The failure message is expected
- It fails because the feature is missing, not due to a typo

Test passes immediately? You're testing existing behavior. Fix the test.

### 3. GREEN — Write Minimal Code

Write the simplest code that makes the test pass. No extra features. No "nice-to-haves." Don't refactor other code.

### 4. Verify GREEN — Watch It Pass

**MANDATORY. Never skip.**

Run the test and confirm:
- Your test passes
- All other tests still pass
- No new errors or warnings

Test still fails? Fix the code, not the test.

### 5. REFACTOR — Clean Up

After green only: remove duplication, improve names, extract helpers. Keep tests green. Do not add behavior.

### 6. Repeat

Move to the next failing test.

## Good Tests

| Quality | Good | Bad |
|---------|------|-----|
| **Minimal** | One thing. "and" in name? Split it. | `test('validates email and domain and whitespace')` |
| **Clear** | Name describes behavior | `test('test1')` |
| **Real** | Tests actual behavior | Tests mock interactions |

## Bug Fix Example

**Bug:** Empty email accepted

```typescript
// RED
test('rejects empty email', async () => {
  const result = await submitForm({ email: '' });
  expect(result.error).toBe('Email required');
});

// Verify RED: FAIL — expected 'Email required', got undefined

// GREEN
function submitForm(data: FormData) {
  if (!data.email?.trim()) return { error: 'Email required' };
  // ...
}

// Verify GREEN: PASS
```

## Verification Checklist

Before marking work complete:

- [ ] Every new function/method has a test written before the implementation
- [ ] Watched each test fail before implementing
- [ ] Each test failed for the expected reason (feature missing, not typo)
- [ ] Wrote minimal code to pass each test
- [ ] All tests pass with clean output
- [ ] Edge cases covered

## Red Flags — Stop and Start Over

| Rationalization | Reality |
|---|---|
| "Too simple to test" | Simple code breaks too. Test takes 30 seconds. |
| "I'll write tests after" | Tests passing immediately prove nothing. |
| "Already manually tested" | Ad-hoc ≠ systematic. You can't re-run it. |
| "Deleting X hours is wasteful" | Sunk cost. Keeping unverified code is technical debt. |
| "TDD will slow me down" | TDD is faster than debugging. |
| "Keep as reference, write tests first" | You'll adapt it. That's testing after. Delete means delete. |

Any of these? Delete code. Start over with TDD.

## When Stuck

| Problem | Solution |
|---------|----------|
| Don't know how to test | Write the wished-for API. Write the assertion first. |
| Test too complicated | Design too complicated. Simplify the interface. |
| Must mock everything | Code too coupled. Use dependency injection. |
| Test setup huge | Extract helpers. Still complex? Simplify the design. |

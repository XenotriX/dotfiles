# Global Claude Instructions

## Temporary Files

Always store temporary files in `/tmp/claude` instead of `/tmp`. Create the directory first if it doesn't exist:

```bash
mkdir -p /tmp/claude
```

## Code Comments

When writing comments in code, ensure they are context-independent and make sense without knowledge of the current task.

**Bad examples:**
- `# Implement TabService (Phase 1)` - references the task/phase
- Adding `# In degree Celsius` to an unchanged line - don't comment lines that aren't being modified

**Guidelines:**
- Only add comments to lines you're actually changing, unless strictly necessary
- Comments should describe what the code does, not what task you're working on
- Exception: if surrounding code follows a different commenting style, match that style for consistency

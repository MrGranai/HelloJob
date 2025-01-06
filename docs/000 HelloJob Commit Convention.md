# 000 HelloJob Commit Convention

To keep the commit history organized and easy to understand, all commits must follow the convention below:

---

## 1. Commit Structure:
```
[TYPE](SCOPE): Brief summary of the commit (max 70 characters)

- Detailed explanation of what was done.  
- List key changes, one per line, focusing on clarity.  
- Highlight specific improvements or fixes.  
- If necessary, explain the reason for the change or its impact.  
```
- **TYPE**: Defines the nature of the change (e.g., new feature, bug fix, documentation).  
- **SCOPE (Optional)**: The part of the project affected (e.g., api, auth, frontend, db).  
- **Description**: Should be brief but informative.  

---

## 2. Accepted Commit Types:

| **Type**        | **Description**                                         |
|-----------------|--------------------------------------------------------|
| **[INIT]**      | Project initialization or major new feature setup.      |
| **[FEAT]**      | New feature.                                            |
| **[FIX]**       | Bug fix.                                                |
| **[DOCS]**      | Documentation updates.                                  |
| **[STYLE]**     | Formatting and visual adjustments (no logic changes).   |
| **[REFACTOR]**  | Code refactoring without changing functionality.        |
| **[TEST]**      | Adding or modifying tests.                              |
| **[CHORE]**     | Project maintenance (build, dependencies).              |
| **[INFRA]**     | Infrastructure changes (Docker, CI/CD).                 |
| **[SECURITY]**  | Security patches or vulnerability fixes.                |
| **[CONFIG]**    | Configuration file changes.                             |
| **[DEVOPS]**    | Automation or pipeline scripts.                         |

---

## 3. Common Scopes:

| **Scope**       | **Description**                                         |
|-----------------|--------------------------------------------------------|
| **api**         | API endpoints.                                          |
| **auth**        | Authentication/authorization.                           |
| **frontend**    | User interface.                                         |
| **backend**     | Server-side logic.                                      |
| **db**          | Database and migrations.                                |
| **deps**        | Project dependencies.                                   |
| **ci**          | Continuous integration/pipeline.                        |
| **readme**      | Main documentation.                                     |
| **docker**      | Container configuration.                                |
| **tests**       | Unit/integration tests.                                 |
| **infra**       | General infrastructure.                                 |
| **ui**          | Interface components.                                   |

---

## 4. Commit Examples:
```bash
INIT: start project with folder structure
FEAT(api): add endpoint for user login
FIX(db): resolve migration rollback issue
DOCS(readme): update installation instructions
CHORE(deps): upgrade axios to latest version
REFACTOR(auth): optimize password hashing
```

---

## 5. General Rules:
1. **Clarity**: The message must be descriptive and clear.  
2. **English**: All commits must be written in English to ensure standardization.  
3. **Conciseness**: Avoid long descriptions; prioritize short and direct messages.  
4. **Consistency**: All team members must follow the convention.  

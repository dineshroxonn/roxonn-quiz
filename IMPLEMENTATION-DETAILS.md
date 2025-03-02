# Roxonn Quiz - Implementation Details

This document provides technical details about the implementation of the Roxonn quiz repository.

## Repository Structure

```
roxonn-quiz/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   └── quiz-question.md      # Template for quiz questions
│   └── workflows/
│       └── quiz-checker.yml      # GitHub Actions workflow for checking answers
├── quiz-questions/
│   ├── question1.md              # Sample quiz question 1
│   ├── question2.md              # Sample quiz question 2
│   ├── question3.md              # Sample quiz question 3
│   ├── question4.md              # Sample quiz question 4
│   └── question5.md              # Sample quiz question 5
├── ADMIN-GUIDE.md                # Guide for repository administrators
├── create-issues.sh              # Script to create quiz issues
├── IMPLEMENTATION-DETAILS.md     # This file
├── README.md                     # Main repository README
└── USER-GUIDE.md                 # Guide for quiz participants
```

## Key Components

### 1. Quiz Questions

Each quiz question is stored as a markdown file in the `quiz-questions` directory. Questions follow a standard format:

```markdown
# Quiz Question: [Topic]

## Question

[Question text]

## Options

A) [Option A]
B) [Option B]
C) [Option C]
D) [Option D]

## How to Answer

Comment on this issue with just the letter of your answer (e.g., 'A').

<!-- CORRECT_ANSWER: X -->
```

The correct answer is stored in an HTML comment at the end of the file, which is not visible to users on GitHub but can be read by the GitHub Actions workflow.

### 2. GitHub Actions Workflow

The `quiz-checker.yml` workflow is triggered when a comment is added to an issue. It:

1. Checks if the issue has the "quiz" label
2. Extracts the correct answer from the issue body
3. Compares the user's answer in the comment
4. If correct:
   - Creates a branch
   - Creates an answer file
   - Creates a pull request that closes the issue
   - Comments with congratulations and social sharing instructions
5. If incorrect:
   - Comments that the answer is wrong

### 3. Issue Creation Script

The `create-issues.sh` script automates the creation of quiz question instances. It:

1. Takes each question file in the `quiz-questions` directory
2. Creates multiple instances as GitHub issues
3. Uses the GitHub CLI (`gh`) to create the issues

## Integration with Roxonn Platform

The quiz system integrates with the Roxonn platform's reward mechanism:

1. When a user answers correctly, a pull request is created and the issue is closed
2. The pull request includes the user's GitHub username in the branch name
3. The Roxonn platform can identify these PRs and distribute tokens accordingly

## Security Considerations

1. The correct answers are hidden in HTML comments in the issue body
2. Only the first answer from each user is considered
3. The GitHub Actions workflow runs with limited permissions
4. The answer checking logic is server-side, not client-side

## Customization Options

The quiz system can be customized in several ways:

1. **Number of Questions**: Add more question files to the `quiz-questions` directory
2. **Number of Instances**: Modify the `INSTANCES_PER_QUESTION` variable in `create-issues.sh`
3. **Reward Amount**: Configure through the Roxonn platform
4. **Question Format**: Modify the `quiz-question.md` template

## Future Enhancements

Potential improvements that could be made:

1. Add support for different question types (beyond multiple choice)
2. Implement a leaderboard for quiz participants
3. Add automation for creating and applying the "quiz" label
4. Enhanced analytics and tracking of user participation
5. Automated reward distribution confirmation 
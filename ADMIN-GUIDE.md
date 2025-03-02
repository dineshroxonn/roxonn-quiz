# Roxonn Quiz - Admin Guide

This guide provides instructions for administrators of the Roxonn Quiz repository.

## Setting Up the Quiz

The repository has been set up with the following components:
1. A README.md file explaining the Roxonn platform and quiz process
2. A GitHub Actions workflow for checking quiz answers
3. An issue template for quiz questions
4. Sample quiz questions
5. A script for creating quiz instances

## Required Manual Steps

After setting up the repository, you need to perform the following manual steps:

### 1. Create the "quiz" Label

The GitHub Actions workflow relies on the "quiz" label to identify quiz questions. To create this label:

1. Go to your repository on GitHub: https://github.com/dineshroxonn/roxonn-quiz
2. Navigate to "Issues" > "Labels" (or directly to https://github.com/dineshroxonn/roxonn-quiz/labels)
3. Click "New label"
4. Enter the following:
   - Label name: `quiz`
   - Description: `Questions for the Roxonn quiz`
   - Color: Choose a color (e.g., green - #0E8A16)
5. Click "Create label"

### 2. Apply the "quiz" Label to Existing Issues

Now that the label is created, apply it to all existing quiz issues:

1. Go to the Issues tab: https://github.com/dineshroxonn/roxonn-quiz/issues
2. Click on the checkbox at the top to select all issues
3. Click on "Label" in the menu that appears
4. Select the "quiz" label
5. All selected issues will now have the "quiz" label

### 3. Setting Up Rewards

To set up rewards for correct quiz answers:

1. Determine the amount of tokens to reward for each correct answer
2. Configure the Roxonn platform to recognize the quiz repository
3. Ensure the pull requests created by the GitHub Actions workflow trigger the reward distribution

## Maintaining the Quiz

### Adding New Questions

To add new quiz questions:

1. Create a new markdown file in the `quiz-questions` directory
2. Follow the format of the existing questions
3. Include the correct answer in the comment: `<!-- CORRECT_ANSWER: X -->`
4. Run the `create-issues.sh` script to create instances of the new question

### Modifying the GitHub Actions Workflow

If you need to modify the quiz checking behavior:

1. Edit the `.github/workflows/quiz-checker.yml` file
2. Test your changes by submitting a sample answer to an issue

### Troubleshooting

If issues arise with the quiz system:

1. Check the GitHub Actions logs for any errors
2. Verify that issues have the "quiz" label
3. Ensure that correct answers are properly formatted in the issue body
4. Check that users are submitting answers in the correct format

## Contact

For questions or assistance, contact the Roxonn development team. 
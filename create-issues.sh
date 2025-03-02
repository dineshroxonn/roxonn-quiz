#!/bin/bash

# This script creates multiple instances of each quiz question
# It's meant to be run after the repository is created on GitHub

# Change these variables as needed
REPO_OWNER="dineshroxonn"
REPO_NAME="roxonn-quiz"
INSTANCES_PER_QUESTION=5

# Array of question topics from the question files
QUESTION_FILES=("question1.md" "question2.md" "question3.md" "question4.md" "question5.md")
QUESTION_TOPICS=(
  "How contributors earn tokens"
  "Blockchain technology used"
  "Who can allocate rewards"
  "Wallet security"
  "User authentication"
)

# Create issues for each question and instance
for i in "${!QUESTION_FILES[@]}"; do
  QUESTION_FILE="quiz-questions/${QUESTION_FILES[$i]}"
  TOPIC="${QUESTION_TOPICS[$i]}"
  
  echo "Creating instances for question: $TOPIC"
  
  # Get content and correct answer
  CONTENT=$(cat "$QUESTION_FILE")
  CORRECT_ANSWER=$(echo "$CONTENT" | grep -o "<!-- CORRECT_ANSWER: [A-Z] -->" | cut -d' ' -f3)
  
  # Create multiple instances
  for j in $(seq 1 $INSTANCES_PER_QUESTION); do
    TITLE="Quiz Question: $TOPIC - Instance $j"
    
    echo "Creating: $TITLE"
    
    # Use GitHub CLI to create the issue without label for now
    # This requires gh CLI to be authenticated
    gh issue create \
      --repo "$REPO_OWNER/$REPO_NAME" \
      --title "$TITLE" \
      --body "$CONTENT"
    
    # Pause to avoid rate limiting
    sleep 1
  done
done

echo "All quiz questions created successfully!" 
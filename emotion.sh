#!/bin/bash

GOOD_ARRAY=("！" "!")
GOOD_EMOJI_ARRAY=("" "👍" "🙌" "🤝" "💯")
QUESTION_ARRAY=("？" "?")
QUESTION_EMOJI_ARRAY=("" "🤔" "👀")
NORMAL_EMOJI_ARRAY=("" "😃" "〜")

function detect_emotion() {
    str="$@"
    last_char="${str: -1}"
    emotion=""

    if [[ "${GOOD_ARRAY[*]}" =~ "${last_char}" ]]; then
        emotion="good"
    elif [[ "${QUESTION_ARRAY[*]}" =~ "${last_char}" ]]; then
        emotion="question"
    else
        emotion="normal"
    fi

    echo $emotion
}

function random_emoji() {
    emotion=$1
    emoji=""

    if [[ $emotion = "good" ]]; then
        emoji=${GOOD_EMOJI_ARRAY[$(($RANDOM % ${#GOOD_EMOJI_ARRAY[*]}))]}
    elif [[ $emotion = "question" ]]; then
        emoji=${QUESTION_EMOJI_ARRAY[$(($RANDOM % ${#QUESTION_EMOJI_ARRAY[*]}))]}
    else
        emoji=${NORMAL_EMOJI_ARRAY[$(($RANDOM % ${#NORMAL_EMOJI_ARRAY[*]}))]}
    fi

    echo $emoji
}

function add_emoji() {
    str="$@"
    emotion=$(detect_emotion $str)
    emoji=$(random_emoji $emotion)

    echo "${str}${emoji}"
}

while IFS= read -r line; do
    add_emoji "$line"
done

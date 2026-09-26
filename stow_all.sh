#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles/dotfiles"

echo "Linking config files to '$HOME/'"

# Enter the directory containing the Stow packages
cd "$DOTFILES_DIR" || {
    echo -e "\033[31mFailed to enter '$DOTFILES_DIR'.\033[0m"
    exit 1
}

for dir in */; do
    if [ -d "$dir" ]; then
        sleep 0.1

        # Remove trailing slash
        dir="${dir%/}"

        echo "Stowing files from '$dir' into '$HOME/'"

        stow --target="$HOME" --restow "$dir"

        if [ $? -eq 0 ]; then
            echo -e "\033[32mSuccessfully stowed '$dir'.\033[0m"
        else
            echo -e "\033[31mStow failed for '$dir'.\033[0m"
        fi
    fi
done

#!/usr/bin/env zsh

# shellcheck disable=SC2034

THEME_ROOT=${0:A:h}

source "${THEME_ROOT}/modules/init.zsh"

source "${THEME_ROOT}/libs/promptlib/activate"
source "${THEME_ROOT}/libs/zsh-async/async.zsh"
source "${THEME_ROOT}/libs/zsh-256color/zsh-256color.plugin.zsh"

source "${THEME_ROOT}/modules/theme.zsh"
source "${THEME_ROOT}/modules/sections.zsh"
source "${THEME_ROOT}/modules/prompt.zsh"
source "${THEME_ROOT}/modules/system.zsh"
source "${THEME_ROOT}/modules/git.zsh"
source "${THEME_ROOT}/modules/hg.zsh"
source "${THEME_ROOT}/modules/svn.zsh"
source "${THEME_ROOT}/modules/async.zsh"
source "${THEME_ROOT}/modules/python.zsh"
source "${THEME_ROOT}/modules/version.zsh"

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst
  gruv_load_theme

  if [[ ${PROMPT} == "" ]] || [[ ${GRUV_KEEP_PROMPT} != 1 ]]; then
    PROMPT="$(gruv_prompt_render_left)"
    RPROMPT="$(gruv_prompt_render_right)"
  fi

  gruv_async_left_prompt
  gruv_async_right_prompt
}

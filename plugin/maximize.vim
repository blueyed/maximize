" Author: Eric Van Dewoestine
" Version: 0.1
"
" Description: {{{
"   Adds functionality to maximize or minimize windows.
" }}}
"
" License: {{{
"   Copyright (c) 2005 - 2010, Eric Van Dewoestine
"   All rights reserved.
"
"   Redistribution and use of this software in source and binary forms, with
"   or without modification, are permitted provided that the following
"   conditions are met:
"
"   * Redistributions of source code must retain the above
"     copyright notice, this list of conditions and the
"     following disclaimer.
"
"   * Redistributions in binary form must reproduce the above
"     copyright notice, this list of conditions and the
"     following disclaimer in the documentation and/or other
"     materials provided with the distribution.
"
"   * Neither the name of Eric Van Dewoestine nor the names of its
"     contributors may be used to endorse or promote products derived from
"     this software without specific prior written permission of
"     Eric Van Dewoestine.
"
"   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
"   IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
"   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
"   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
"   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
"   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
"   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
"   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
"   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
"   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
"   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
" }}}

if v:version < 700
  finish
endif

let s:save_cpo=&cpo
set cpo&vim

" Global Variables {{{
if !exists('g:MaximizeStatusLine')
  let g:MaximizeStatusLine = '%<%f\ %M\ %h%r%=%-10.(%l,%c%V\ b=%n,w=%{winnr()}%)\ %P'
endif

if exists('g:MaximizeStatusLineEnabled') && g:MaximizeStatusLineEnabled
  exec "set statusline=" . g:MaximizeStatusLine
endif
" }}}

" Command Declarations {{{
if !exists(":MaximizeWindow")
  command MaximizeWindow :call maximize#MaximizeWindow(0)
  command MaximizeWindowFull :call maximize#MaximizeWindow(1)
endif
if !exists(":MinimizeWindow")
  command -nargs=* MinimizeWindow :call maximize#MinimizeWindow(<f-args>)
  command MinimizeRestore
      \ call maximize#ResetMinimized() |
      \ call maximize#RestoreWindows(0)
endif
" }}}

let &cpo = s:save_cpo

" vim:ft=vim:fdm=marker
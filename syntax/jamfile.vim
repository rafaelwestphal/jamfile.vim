" Vim syntax file
" Language: Jamfile
" Maintainer: Rafael Westphal
" Latest Revision: March 9, 2016
"
if exists("b:current_syntax")
 finish
endif

"let g:tex_isk=1
set iskeyword+=-
" Remove any old syntax stuff hanging around
syn clear
syn case match
"syn keyword k_jamfileFeatureSwitch runtime-debugging profiling rtti exception-handling openmp asynch-exceptions extern-c-nothrow debug-symbols strip nextgroup=jamfileFeatureOnOff 
" skipwhite

"syn match m_jamfileFeaturePair /\(*\)\([^ ]*\)/ contains=k_jamfileFeatureSwitch,m_jamfileFeatureOnOff
"syn match m_jamfileGrist /<\([^>]*\)>\([^ ]*\)/ contains=k_jamfileFeatureSwitch ",m_jamfileFeatureOnOff
"syn keyword k_jamfileFeatureLink link runtime-link nextgroup=jamfileFeatureSharedStatic
"syn keyword k_jamfileFeatureThreading  threading nextgroup=jamfileFeatureMultiSingle
"syn keyword m_jamfileFeatureMultiSingle multi contained
"syn match m_jamfileFeatureMultiSingle single contained
"syn match m_jamfileFeatureSharedStatic shared contained 
"syn match m_jamfileFeatureSharedStatic static contained
syn keyword m_jamfileFeatureOnOff on contained
syn keyword m_jamfileFeatureOnOff off contained


"new stuff brllow
syn keyword k_jamfileKeywords if else for in actions rule switch include case default true false

syn keyword k_jamfileRules project lib exe glob install using explicit build-project alias conditional glob-tree unit-test import contained
syn keyword k_jamfileAssignment path-constant constant local use-project alias contained 
syn keyword k_jamfileFeatureReference host-os target-os toolset stdlib optimization inlining threading instrument define undef "include" cflags cxxflags fflags asmflags linkflags archiveflags version flags location-prefix use dependency implicit-dependency warnings warnings-as-errors c++-template-depth source library file find-shared-library find-static-library library-path library-file find-object-file name tag search location dll-path hardcode-dll-paths xdll-path def-file suppress-import-lib action allow address-model architecture instruction-set c++abi conditional build user-interface variant 

syn match m_jamfileGrist /<\([^>]*\)>/ contains=k_jamfileFeatureReference contained

"syn match jamfileGrist /<\([^>]*\)>[^ ]*/ contains=jamfileJambase

"syntax match m_jamfileDeclaration /\(\k\+\)[ ]*/  contains=k_jamfileRules nextgroup=m_jamfileSimpleValue contained

syntax match m_simpleDeclaration "\k\+\s\{1}" contains=k_jamfileRules nextgroup=m_jamfileSimpleValue
syntax match m_jamfileAssignment /\(\k\+\)[ ]*/  contains=k_jamfileAssignment nextgroup=m_jamfileSimpleVar 
syntax match m_jamfileSimpleVar "\k\+" contained nextgroup=m_simpleAssignment skipwhite
syntax match m_simpleAssignment ":" contained nextgroup=m_simpleValue skipwhite
syntax match m_simpleAssignment "=" contained nextgroup=m_simpleValue skipwhite
syntax match m_simpleValue "\k\+ ;"he=e-1 contains=r_jamfileError contained 

"syntax match m_jamfilesimpleEqualVar "\k\+[^ ]" contained nextgroup=m_simpleEqualAssignment
"syntax match m_jamfilesimpleEqualAssignment "=" contained nextgroup=m_simpleEqualValue
"syntax match m_jamfilesimpleEqualValue ".*^[;];" contained
"syntax match simpleVar "\k\+" nextgroup=simpleAssignment
"syntax match simpleAssignment " = " contained nextgroup=simpleValue
"syn match simpleValue ".*[^;];" contained

"hi def link simpleVar Identifier
"hi def link simpleAssignment Statement
"hi def link simpleValue String
syntax region r_jamfileAssignment start=":"hs=e+1 end=" ;"me=e-1 oneline contains=CONTAINED,jamfileTodo,r_jamfileRegistry
syntax region r_jamfileRegistry start=/\[/ end=/]/  contained oneline contains=CONTAINED,jamfileTodo

"add contained to this region
syntax region r_jamfileVariableValue start=/\$(/ms=e+1,hs=e+1 end=/)/me=e-1,hs=s+2 oneline contains=jamfileTodo 
syntax region r_jamfileString start=/\v"/ skip=/\v\\./ end=/\v"/
syn match m_jamfileError "[^ ];"hs=s+1
"syn region r_jamfileError start="*" end="[^ \t];" 
syn region r_jamfileComment start="#" end="$" contains=jamfileTodo,m_jamfileError
"
"syn region r_jamfileAssignment start=k_jamfileAssignment end=";" 
hi link r_jamfileAssignment Statement

syn keyword jamfileTodo TODO FIXME XXX
if !exists("did_jamfile_syntax_inits")
  let did_jamfile_syntax_inits = 1
	hi link k_jamfileKeywords Statement
  highlight link r_jamfileVariableValue String
	highlight link r_jamfileString String
  highlight link jamfileTodo Todo
  highlight link r_jamfileRegistry Statement
  "hi link k_jamfileFeatureReference Special
	hi link m_jamfileError       Error
	hi link r_jamfileComment     Comment
	hi link m_jamfileGrist       Special
	hi link k_jamfileRules       Error
	hi link k_jamfileAssignment  Identifier
	hi link m_simpleDeclaration Special
	"hi link m_jamfileAssignment  Type
	"hi link m_jamfileSimpleVar  Error
	hi link m_SimpleAssignment Todo
	hi link m_simpleValue Error
	"hi link m_jamfileFeatureOnOff String
	"hi link m_jamfileVariable     String
  "hi link m_jamfileFeatureMultiSingle Type
  "hi link m_jamfileFeatureSharedStatic Type
  "hi link m_jamfileFeatureOnOff Type
endif

let b:current_syntax = "jamfile"
"set makeprg=bjam

"feature.feature host-os : $(.os-names) ;
"feature.feature target-os : $(.os-names) : propagated link-incompatible ;
"feature.feature toolset            :                 : implicit propagated symmetric ;
"feature.feature stdlib             : native          : propagated composite ;
"feature.feature optimization       : off speed space : propagated ;
"feature.feature inlining           : off on full     : propagated ;
"feature.feature instrument         : none
"feature.feature define             :                 : free ;
"feature.feature undef              :                 : free ;
"feature.feature "include"          :                 : free path ; #order-sensitive ;
"feature.feature cflags             :                 : free ;
"feature.feature cxxflags           :                 : free ;
"feature.feature fflags             :                 : free ;
"feature.feature asmflags           :                 : free ;
"feature.feature linkflags          :                 : free ;
"feature.feature archiveflags       :                 : free ;
"feature.feature version            :                 : free ;
"feature.feature flags           : : free ;
"feature.feature location-prefix : : free ;
"feature.feature use                 : : free dependency incidental ;
"feature.feature dependency          : : free dependency incidental ;
"feature.feature implicit-dependency : : free dependency incidental ;
"feature.feature warnings :
"feature.feature warnings-as-errors :
"feature.feature c++-template-depth
"feature.feature source              :            : free dependency incidental ;
"feature.feature library             :            : free dependency incidental ;
"feature.feature file                :            : free dependency incidental ;
"feature.feature find-shared-library :            : free ; #order-sensitive ;
"feature.feature find-static-library :            : free ; #order-sensitive ;
"feature.feature library-path        :            : free path ; #order-sensitive ;
"feature.feature library-file        :            : free dependency ;
"feature.feature find-object-file    :            : free ; #order-sensitive ;
"feature.feature name                :            : free ;
"feature.feature tag                 :            : free ;
"feature.feature search              :            : free path ; #order-sensitive ;
"feature.feature location            :            : free path ;
"feature.feature dll-path            :            : free path ;
"feature.feature hardcode-dll-paths  : true false : incidental ;
"feature.feature xdll-path : : free path ;
"feature.feature def-file : : free dependency ;
"feature.feature suppress-import-lib : false true : incidental ;
"feature.feature action : : free ;
"feature.feature allow : : free ;
"feature.feature address-model : 16 32 64 32_64 : propagated optional ;
"feature.feature architecture :
"feature.feature instruction-set :
"feature.feature c++abi : : propagated optional ;
"feature.feature conditional : : incidental free ;
"feature.feature build : yes no : optional ;
"feature.feature user-interface : console gui wince native auto ;
"feature.feature variant : : implicit composite propagated symmetric ;



*** Settings ***
Documentation      Here we have documentation for this suite.\nDocumentation is often quite long.\n\nIt can also contain multiple paragraphs.
Default Tags       default tag 1    default tag 2    default tag 3    default tag 4    default tag 5
Library  DebugLibrary

*** Variable ***
@{LIST}            this     list     is    quite    long     and    items in it can also be long

*** Test Cases ***
Example
    [Tags]    you    probably    do    not    have    this    many    tags    in    real    life
    debug
    Do X    first argument    second argument    third argument    fourth argument    fifth argument    sixth argument
    ${var} =    Get X    first argument passed to this keyword is pretty long    second argument passed to this keyword is long too
/*! @file mygdb.md  A gdb cheat sheet

Start gdb with program and its arguments
========================================
$ gdb --args prog arg1 arg2 arg3

Help
====
- help                  list of classes of commands
- help all              list all commands
- apr WORD              Search for command related to "WORD"

Commands
========
- n
- s
- finish                Or fi as short form
- up
- down 
- bt
- frame

Break point and watch point
===========================
- h b
- b                     Set break point at current position
- b 100                 Set break point at line 100
- b func1               Set break point at func1
- b +100                Set break point at current line + 100
- b *0x08048123         Set break point at address 0x08048123
- b file.c:100          Set break point at line 100 of file.c
- tb                    Set break once point
- b 100 if (var == 5)   Set condiation break point
- b 100                 Set break point with command
    commands
    silent
    printf "x is %d\n", x
    end
- b String::func1       Set break point at overloading function
- clear 100             Clear break point by addressing
- clear func1 
- del 5                 Delete/Disable/Enable breakpoint by breakpoint number
- diable 3
- enable 2
- cond 3 (var > 3)      Set a conditation at break point by its number
- cond 3                Remove the condition of breakpoint 3 
- save b bb             Save all breakpoints to bb file
- source bb             Source breakpoints by bb file




Print Variable and Dump Memory
==============================
- h p or h x
- p var                 print var value
- p &var                print var address
- p *var                print value of var pointer
- display var           display var after every 'step', 'next' command
- undisplay var         remove var from displaying action.
- p (var=value)         Set value to var
- p/x var               print value with format
                        /x  hex, /u unsigned digit, /d digit, /t binary
                        /f float, /a address, i instruction, /c char, /s string
                        /z hex zero padded on the left, /o octal
- x/FMT ADDR            Examine memory
                        FMT = {n}{fmt}{s}, 
                              {n} are repeat count, 
                              {fmt} are x,u,d, ... same as print command
                              {s} are b(byte), h(halfword), w(word), g(giant, 8 bytes)
                        for example, x/3uh 0x8048012

Show GDB Status
===============
- h status, h info
- info b
- info all-registres    List of all registers and contents
- info threads
- list 
- disas
- whatis var
- ptype var
- set 


GDB internal variables
======================






































*/

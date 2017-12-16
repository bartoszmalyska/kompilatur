%{
             #include <iostream>
             #include <vector>
             #include <stack>
             #include <fstream>
             #include <string>

             using namespace std;

             void acc(string s);
	void get();
	void put();
             void load(int i);
             void loadi(int i);
             void store(int i);
             void storei(int i);
             void add(int i);
             void addi(int i);
             void sub(int i);
             void subi(int i);
             void shr(int i);
             void shl(int i);
             void inc();
             void dec();
             void zero();
             void jump(int i);
             void jzero(int i);
             void jodd(int i);
             void halt();

%}
//C and parser declarations
%token VAR BEGIN END
%token ID
%token NUM
%token SEMIC
%token READ WRITE
%token IF THEN ELSE ENDIF
%token WHILE DO ENDWHILE
%token FOR FROM TO DOWNTO DO ENDFOR
%token ASSIGN
%token ADD SUBT MULT DIV MOD
%token EQ DIFF LT GT LE GE
%token TAB

%%
//Grammar rules and actions
program : VAR vdeclarations BEGIN commands END {/*terminate*/};

vdeclarations:  vdeclarations pidentifier
| vdeclarations pidentifier[num]
|
;

commands : /* empty */
| commands command
;

command: identifier ASSIGN expression;
| IF condition THEN commands ELSE commands ENDIF
| IF condition THEN commands ENDIF
| WHILE condition DO commands ENDWHILE
| FOR pidentifier FROM value TO value DO commands ENDFOR
| FOR pidentifier FROM value DOWNTO value DO commands ENDFOR
| READ identifier;
| WRITE value;//komendy
;

expression: value
| value ADD value
| value SUBT value
| value MULT value
| value DIV value
| value MOD value
;

condition: value EQ value
| value DIFF value
| value LT value
| value GT value
| value LE value
| value GE value
;

value: NUM
| identifier
;

identifier: ID
| ID[ID]
| ID[NUM]
;

%%
//C subroutines

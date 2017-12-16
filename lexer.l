%{
 bool comment = false;
%}
%%
[ \t\n]		{}

\(\*			{
					if(comment)
						printf("Nested comments are forbidden\n");
					else
						comment = true;
				}
\*\)			{
					if(!comment)
						printf("Comment closure without beginning\n");
					else
						comment = false;
				}
-[0-9]+ {/*niedozwolony*/}
[0-9]+ {/*NUM*/}
[_a-z]+ {if(!comment) return ID;}
[:=] { if(!comment) return ASSIGN; }
[+] { if(!comment) return ADD; }
[-]{ if(!comment) return SUBT; }
[*] { if(!comment) return MULT; }
[/] { if(!comment) return DIV; }
[%] { if(!comment) return MOD; }
[;] { if(!comment) return SEMIC; }
[!=] { if(!comment) return DIFF; }
[=] { if(!comment) return EQ; }
[<=] { if(!comment) return LE; }
[>=] { if(!comment) return GE; }
[<> { if(!comment) return LT; }
[< >] { if(!comment) return GT; }
VAR { if(!comment) return VAR; }
BEGIN { if(!comment) return BEGIN; }
END { if(!comment) return END; }
IF		{ if(!comment) return IF; }
THEN		{ if(!comment) return THEN; }
ELSE		{ if(!comment) return ELSE; }
ENDIF		{ if(!comment) return ENDIF; }
WHILE		{ if(!comment) return WHILE; }
DO		{ if(!comment) return DO; }
ENDWHILE		{ if(!comment) return ENDWHILE; }
FOR { if(!comment) return FOR; }
FROM { if(!comment) return FROM; }
TO { if(!comment) return TO; }
DOWNTO { if(!comment) return DOWNTO; }
ENDFOR { if(!comment) return ENDFOR; }
WRITE { if(!comment) return WRITE; }
READ { if(!comment) return READ; }





%%

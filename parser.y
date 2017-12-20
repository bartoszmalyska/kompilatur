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
             void shr();
             void shl();
             void inc();
             void dec();
             void zero();
             void jump(int i);
             void jzero(int i);
             void jodd(int i);
             void halt();
             void add(string a, string b);
             void subt(string a, string b);
             void mult(string a, string b);
             void div(string a, string b);
             void mod(string a, string b);
             void eq(string a, string b);
             void diff(string a, string b);
             void lt(string a, string b);
             void gt(string a, string b);
             void le(string a, string b);
             void ge(string a, string b);

%}
//C and parser declarations
%token VAR BEGIN END
%token ID
%token NUM
%token READ WRITE
%token IF THEN ELSE ENDIF
%token WHILE DO ENDWHILE
%token FOR FROM TO DOWNTO DO ENDFOR
%token ASSIGN
%token ADD SUBT MULT DIV MOD
%token EQ DIFF LT GT LE GE
%token TAB

vector<variable> var;
vector<string> reg;
vector<string> com;
string acc = "-1";
long long k = 0;

%%
//Grammar rules and actions
program : VAR vdeclarations BEGIN commands END {/*wypisz*/ halt();}

vdeclarations:  vdeclarations ID
| vdeclarations ID[NUM]
|
;

commands : /* empty */
| commands command
;

command: identifier ASSIGN expression;
| IF condition THEN commands ELSE commands ENDIF
| IF condition THEN commands ENDIF
| WHILE condition DO commands ENDWHILE
| FOR ID FROM value TO value DO commands ENDFOR
| FOR ID FROM value DOWNTO value DO commands ENDFOR
| READ identifier;
| WRITE value;//komendy
;

expression: value {/*val*/}
| value ADD value {add($1,$3);}
| value SUBT value {sub($1,$3);}
| value MULT value {mult($1,$3);}
| value DIV value {div($1,$3);}
| value MOD value {mod($1,$3);}
;

condition: value EQ value {eq($1,$3);}
| value DIFF value {diff($1,$3);}
| value LT value {lt($1,$3);}
| value GT value {gt($1,$3);}
| value LE value {le($1,$3);}
| value GE value {ge($1,$3);}
;

value: NUM {}
| identifier {/*sprawdzanko*/}
;

identifier: ID
| ID[ID]
| ID[NUM]
;

%%
//C subroutines

///dla interpretera
void get(){
	stringstream ss;
	ss << "GET";
	k++;
	komendy.push_back(ss.str());
}
void put(){
	stringstream ss;
	ss << "PUT";
	k++;
	komendy.push_back(ss.str());
}
void load(int i)
{
	stringstream ss;
	ss << "LOAD " << i;
	k++;
	komendy.push_back(ss.str());
}
void loadi(int i)
{
	stringstream ss;
	ss << "LOADI " << i;
	k++;
	komendy.push_back(ss.str());
}
void store(int i)
{
	stringstream ss;
	ss << "STORE " << i;
	k++;
	komendy.push_back(ss.str());
}
void storei(int i)
{
	stringstream ss;
	ss << "STOREI " << i;
	k++;
	komendy.push_back(ss.str());
}
void add(int i)
{
	stringstream ss;
	ss << "ADD " << i;
	k++;
	komendy.push_back(ss.str());
}
void addi(int i)
{
	stringstream ss;
	ss << "ADDI " << i;
	k++;
	komendy.push_back(ss.str());
}
void sub(int i)
{
	stringstream ss;
	ss << "SUB " << i;
	k++;
	komendy.push_back(ss.str());
}
void subi(int i)
{
	stringstream ss;
	ss << "SUBI " << i;
	k++;
	komendy.push_back(ss.str());
}
void inc()
{
	stringstream ss;
	ss << "INC";
	k++;
	com.push_back(ss.str());
}
void dec()
{
	stringstream ss;
	ss << "DEC";
	k++;
	com.push_back(ss.str());
}
void zero()
{
	stringstream ss;
	ss << "ZERO";
	k++;
	com.push_back(ss.str());
}
void shl()
{
	stringstream ss;
	ss << "SHL";
	k++;
	com.push_back(ss.str());
}
void shr()
{
	stringstream ss;
	ss << "SHR";
	k++;
	com.push_back(ss.str());
}
void jump(int i)
{
             stringstream ss;
             ss << "JUMP " << i;
             k++;
             komendy.push_back(ss.str());
}
void jodd(int i)
{
              stringstream ss;
              ss << "JODD " << i;
              k++;
              komendy.push_back(ss.str());
}
void jzero(int i)
{
               stringstream ss;
               ss << "JZERO " << i;
               k++;
               komendy.push_back(ss.str());
}
void halt()
{
                cout << "HALT" << endl;
                k++;
}

///operacje

void add(string a, string b)
{

}
void subt(string a, string b)
{

}
void mult(string a, string b)
{

}
void div(string a, string b)
{

}
void mod(string a, string b)
{

}

/// dodatkowe funkcje

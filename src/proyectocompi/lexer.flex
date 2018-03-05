package proyectocompi;
import java_cup.runtime.*;

%%
%class Lexer
%unicode
%int
%line
%column
%cup
%standalone


%{
	String comment = "";
	String string = "";
        
        public Symbol token(int type){
            return new Symbol(type,yyline,yycolumn);
        }

        public Symbol token(int type,Object value){
            return new Symbol(type,yyline,yycolumn,value);
        }
%}

BooleanValue = "true" | "false"  
Then = "then"
Call = "call"
beginCom = "/%"
endCom = "%/"
Write = "write"
Read = "read"
Function = "function"
Endcase = "endcase"
Default = "default"
While = "while"
Apostrophe = "'"
spaces = (" " | "\n" | "\t")*
endOfLine = ";"
leftBracket = "["
rightBracket = "]"
leftKey = "{"
rightKey = "}"
leftParenthesis = "("
rightParenthesis = ")"
Delimeter = ","
If = "if"
Endif = "endif"
Elseif = "elseif"
Else = "else"
For = "for"
Main = "main"
Switch = "switch"
Case = "case"
Return = "return"
Type = ("int" | "boolean" | "char" | "string")
ArithmeticOperator = "+"|"-"|"*"|"/"
RelationalOperator = "=="|"<="|">="|"<"|">"|"!="
AssignmentOperator = ":=" | "+=" | "-=" | "*=" | "/="
Number = [:digit:]+
VariableName = [:letter:]([:letter:]|[:digit:])*

%state COMMENT
%state STRING
%%

<YYINITIAL>{
        {BooleanValue}  {return token(sym.BooleanValue, new String(yytext()));}
        {Then}  {System.out.println("Then: " + yytext());}
	{Call}	{System.out.println("Call: " + yytext());}
	{Write}	{System.out.println("Write: " + yytext());}
	{Read}	{System.out.println("Read: " + yytext());}
	{beginCom}	{System.out.println("Inicio de Comentario: " + yytext());
				yybegin(COMMENT);}
	{Function}	{System.out.println("Function: " + yytext());}
	{Endcase}	{System.out.println("Endcase: " + yytext());}
	{Default}	{System.out.println("Default: " + yytext());}
	{While}	{System.out.println("While " + yytext());}
	{Apostrophe}	{System.out.println("Apostrophe "+ yytext());
					string = "";
					yybegin(STRING);}
	{If}	{System.out.println("If "+ yytext());}
	{Endif}	{System.out.println("EndIf "+ yytext());}
	{Elseif}	{System.out.println("ElseIf "+ yytext());}
	{Else}		{System.out.println("Else "+ yytext());}
	{For}		{System.out.println("For "+ yytext());}
	{Main}		{System.out.println("Main "+ yytext());}
	{Switch}		{System.out.println("Switch "+ yytext());}
	{Case}		{System.out.println("Case "+ yytext());}
	{Return}	{System.out.println("Return "+ yytext());}
	{Delimeter}	{return token(sym.Delimeter);}
	{leftParenthesis}	{System.out.println("leftPar "+ yytext());}
	{rightParenthesis}	{System.out.println("rightPar "+ yytext());}
	{leftKey}	{System.out.println("leftKkey "+ yytext());}
	{rightKey}	{System.out.println("rightKey "+ yytext());}
	{leftBracket}	{System.out.println("leftBrack "+ yytext());}
	{rightBracket}	{System.out.println("rightBrack "+ yytext());}
	{spaces}	{}
	{Type}			{return token(sym.Type,new String(yytext()));}
	{ArithmeticOperator}	{return token(sym.ArithmeticOperator, new String(yytext()));}
	{RelationalOperator}		{System.out.println("RelOP "+ yytext());}
	{AssignmentOperator}		{return token(sym.AssignmentOperator, new String(yytext()));}
	{Number}					{return token(sym.Number, new String(yytext()));}
	{VariableName}				{return token(sym.VariableName,new String(yytext()));}
	{endOfLine}					{return token(sym.EOL);}
	.				{System.out.println("Error en la linea: " + (yyline + 1) + " columna " + (yycolumn+1) + " Character Not Found: " + yytext());}
        <<EOF>> {System.exit(0);}
}

<COMMENT>{
	{endCom}	{System.out.println("Comentario: " + comment);
				System.out.println("Fin de comentario: " + yytext());
				comment = "";
				yybegin(YYINITIAL);}
	.			{comment+=yytext();}
}
<STRING>{
	{Apostrophe}	{System.out.println("Apostrophe: " + yytext());
			yybegin(YYINITIAL);
                        return token(sym.STRING,string);}
	.				{string+=yytext();}				
}
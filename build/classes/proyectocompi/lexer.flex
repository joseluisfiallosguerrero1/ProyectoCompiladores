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

TwoPoints = ":"
ThreePoints = "..."
And = "AND"
Or = "OR"
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
	{TwoPoints}		{return token(sym.TwoPoints);}
	{ThreePoints}	{return token(sym.ThreePoints);}
	{And}			{return token(sym.And);}
	{Or}			{return token(sym.Or);}
    {BooleanValue}  {return token(sym.BooleanValue, new String(yytext()));}
    {Then}  {return token(sym.Then);}
	{Call}	{return token(sym.Call);}
	{Write}	{System.out.println("Write: " + yytext());}
	{Read}	{System.out.println("Read: " + yytext());}
	{beginCom}	{System.out.println("Inicio de Comentario: " + yytext());
				yybegin(COMMENT);}
	{Function}	{return token(sym.Function);}
	{Endcase}	{return token(sym.Endcase);}
	{Default}	{return token(sym.Default);}
	{While}	{System.out.println("While " + yytext());}
	{Apostrophe}	{System.out.println("Apostrophe "+ yytext());
					string = "";
					yybegin(STRING);}
	{If}	{return token(sym.If);}
	{Endif}	{return token(sym.Endif);}
	{Elseif}	{return token(sym.Elseif);}
	{Else}		{return token(sym.Else);}
	{For}		{System.out.println("For "+ yytext());}
	{Main}		{return token(sym.Main);}
	{Switch}		{return token(sym.Switch);}
	{Case}		{return token(sym.Case);}
	{Return}	{System.out.println("Return "+ yytext());}
	{Delimeter}	{return token(sym.Delimeter);}
	{leftParenthesis}	{return token(sym.leftParenthesis);}
	{rightParenthesis}	{return token(sym.rightParenthesis);}
	{leftKey}	{return token(sym.LeftKey);}
	{rightKey}	{return token(sym.RightKey);}
	{leftBracket}	{System.out.println("leftBrack "+ yytext());}
	{rightBracket}	{System.out.println("rightBrack "+ yytext());}
	{spaces}	{}
	{Type}			{return token(sym.Type,new String(yytext()));}
	{ArithmeticOperator}	{if("+".equals(yytext())){
								return token(sym.AddOP);
							}else if("-".equals(yytext())){
								return token(sym.SubOP);
							}else if("*".equals(yytext())){
								return token(sym.MultOP);
							}else if("/".equals(yytext())){
								return token(sym.DivOP);
							}}
	{RelationalOperator}		{	if("==".equals(yytext())){
										return token(sym.Equal);
									}else if("!=".equals(yytext())){
										return token(sym.NotEqual);
									}else if(">".equals(yytext())){
										return token(sym.GreaterThan);
									}else if("<".equals(yytext())){
										return token(sym.LessThan);
									}else if(">=".equals(yytext())){
										return token(sym.GreaterEqual);
									}else if("<=".equals(yytext())){
										return token(sym.LessEqual);
									} 
									
								}
	{AssignmentOperator}		{
									if(":=".equals(yytext())){
										return token(sym.Assign);
									}else if("+=".equals(yytext())){
										return token(sym.PlusEqual);
									}else if("-=".equals(yytext())){
										return token(sym.MinusEqual);
									}else if("*=".equals(yytext())){
										return token(sym.MultEqual);
									}else if("/=".equals(yytext())){
										return token(sym.DivEqual);
									}
								}
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
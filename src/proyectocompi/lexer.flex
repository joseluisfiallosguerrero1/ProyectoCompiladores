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
Elseif = "elseif"
Else = "else"
For = "for"
Main = "main"
Switch = "switch"
Case = "case"
Return = "return"
Type = ("int" | "boolean" | "char" | "string")
ArrayType = ("int[]" | "char[]" | "string[]" | "boolean[]")
ArithmeticOperator = "+"|"-"|"*"|"/"
RelationalOperator = "=="|"<="|">="|"<"|">"|"!="
AssignmentOperator = ":=" | "+=" | "-=" | "*=" | "/="
Number = [:digit:]+
VariableName = [:letter:]([:letter:]|[:digit:])*

%state COMMENT
%state STRING
%%

<YYINITIAL>{
	{ArrayType}		{return token(sym.ArrayType, new String(yytext()));}
	{TwoPoints}		{return token(sym.TwoPoints, new String(yytext()));}
	{ThreePoints}	{return token(sym.ThreePoints, new String(yytext()));}
	{And}			{return token(sym.And, new String(yytext()));}
	{Or}			{return token(sym.Or, new String(yytext()));}
    {BooleanValue}  {return token(sym.BooleanValue, new String(yytext()));}
	{Call}	{return token(sym.Call, new String(yytext()));}
	{Write}	{System.out.println("Write: " + yytext());}
	{Read}	{System.out.println("Read: " + yytext());}
	{beginCom}	{System.out.println("Inicio de Comentario: " + yytext());
				yybegin(COMMENT);}
	{Function}	{return token(sym.Function, new String(yytext()));}
	{Endcase}	{return token(sym.Endcase, new String(yytext()));}
	{Default}	{return token(sym.Default, new String(yytext()));}
	{While}	{return token(sym.While,new String(yytext()));}
	{Apostrophe}	{System.out.println("Apostrophe "+ yytext());
					string = "";
					yybegin(STRING);}
	{If}	{return token(sym.If, new String(yytext()));}
	{Elseif}	{return token(sym.Elseif, new String(yytext()));}
	{Else}		{return token(sym.Else, new String(yytext()));}
	{For}		{return token(sym.For,new String(yytext()));}
	{Main}		{return token(sym.Main, new String(yytext()));}
	{Switch}		{return token(sym.Switch, new String(yytext()));}
	{Case}		{return token(sym.Case, new String(yytext()));}
	{Return}	{return token(sym.Return, new String(yytext()));}
	{Delimeter}	{return token(sym.Delimeter, new String(yytext()));}
	{leftParenthesis}	{return token(sym.leftParenthesis, new String(yytext()));}
	{rightParenthesis}	{return token(sym.rightParenthesis, new String(yytext()));}
	{leftKey}	{return token(sym.LeftKey, new String(yytext()));}
	{rightKey}	{return token(sym.RightKey, new String(yytext()));}
	{leftBracket}	{return token(sym.LeftBracket, new String(yytext()));}
	{rightBracket}	{return token(sym.RightBracket, new String(yytext()));}
	{spaces}	{}
	{Type}			{return token(sym.Type,new String(yytext()));}
	{ArithmeticOperator}	{if("+".equals(yytext())){
								return token(sym.AddOP, new String(yytext()));
							}else if("-".equals(yytext())){
								return token(sym.SubOP, new String(yytext()));
							}else if("*".equals(yytext())){
								return token(sym.MultOP, new String(yytext()));
							}else if("/".equals(yytext())){
								return token(sym.DivOP, new String(yytext()));
							}}
	{RelationalOperator}		{	if("==".equals(yytext())){
										return token(sym.Equal, new String(yytext()));
									}else if("!=".equals(yytext())){
										return token(sym.NotEqual, new String(yytext()));
									}else if(">".equals(yytext())){
										return token(sym.GreaterThan, new String(yytext()));
									}else if("<".equals(yytext())){
										return token(sym.LessThan, new String(yytext()));
									}else if(">=".equals(yytext())){
										return token(sym.GreaterEqual, new String(yytext()));
									}else if("<=".equals(yytext())){
										return token(sym.LessEqual, new String(yytext()));
									} 
									
								}
	{AssignmentOperator}		{
									if(":=".equals(yytext())){
										return token(sym.Assign, new String(yytext()));
									}else if("+=".equals(yytext())){
										return token(sym.PlusEqual, new String(yytext()));
									}else if("-=".equals(yytext())){
										return token(sym.MinusEqual, new String(yytext()));
									}else if("*=".equals(yytext())){
										return token(sym.MultEqual, new String(yytext()));
									}else if("/=".equals(yytext())){
										return token(sym.DivEqual, new String(yytext()));
									}
								}
	{Number}					{return token(sym.Number, new String(yytext()));}
	{VariableName}				{return token(sym.VariableName,new String(yytext()));}
	{endOfLine}					{return token(sym.EOL, new String(yytext()));}
	.				{System.out.println("Error en la linea: " + (yyline + 1) + " columna " + (yycolumn+1) + " Character Not Found: " + yytext());}
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
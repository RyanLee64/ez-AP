(* Scanner for ezap language*)
{
open Parser
exception SyntaxError of string
}

let digit = ['0' - '9']
let digits = digit+
let whitespace_chars = [' ' '\t']
let newline = '\r' | '\n' | "\r\n"
let whitespace = whitespace_chars | newline
rule token = parse 
    whitespace {token lexbuf} (*eat whitespace*)
(*comments/strings*)
| "//"      {s_comment lexbuf}
| "/*"      {mult_comment lexbuf}
| '"'       {read_string (Buffer.create 17) lexbuf} 

| "socket" {SOCKET} 

| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| '['      { LSQUARE }
| ']'      { RSQUARE }
| '''      { read_first_char (Buffer.create 1) lexbuf } 
| ';'      { SEMI }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { TIMES }
| '/'      { DIVIDE }
| '='      { ASSIGN }
| "=="     { EQ }
| "!="     { NEQ }
| "+="     { ADDASSIGN }
| "@"      { CAT } 
| '<'      { LT }
| "<="     { LEQ }
| ">"      { GT }
| ">="     { GEQ }
| "&&"     { AND }
| "||"     { OR }
| "!"      { NOT }
| "str"    { STRING }
| "if"     { IF }
| "else"   { ELSE }
| "for"    { FOR }
| "while"  { WHILE }
| "return" { RETURN }
| "int"    { INT }
| "char"   { CHAR }
| "bool"   { BOOL }
| "float"  { FLOAT }
| "void"   { VOID }
| "true"   { BLIT(true)  }
| "false"  { BLIT(false) }
| "with"   { WITH }
| "as"     { AS }

| digits as lxm { LITERAL(int_of_string lxm) }
| digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )? as lxm { FLIT(lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*     as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and mult_comment = parse
  "*/" { token lexbuf }
| _    { mult_comment lexbuf }

and s_comment = parse
    "\n"    {token lexbuf}
|   "\r\n"  {token lexbuf} (*windows support*)
|   _       {s_comment lexbuf}



and read_string buf =
  parse
  | '"'       { STRLIT (Buffer.contents buf) }
  | '\\' '/'  { Buffer.add_char buf '/'; read_string buf lexbuf }
  | '\\' '\\' { Buffer.add_char buf '\\'; read_string buf lexbuf }
  | '\\' 'b'  { Buffer.add_char buf '\b'; read_string buf lexbuf }
  | '\\' 'f'  { Buffer.add_char buf '\012'; read_string buf lexbuf }
  | '\\' 'n'  { Buffer.add_char buf '\n'; read_string buf lexbuf }
  | '\\' 'r'  { Buffer.add_char buf '\r'; read_string buf lexbuf }
  | '\\' 't'  { Buffer.add_char buf '\t'; read_string buf lexbuf }
  | [^ '"' '\\']+
    { Buffer.add_string buf (Lexing.lexeme lexbuf);
      read_string buf lexbuf
    }
  | _ { raise (SyntaxError ("Illegal string character: " ^ Lexing.lexeme lexbuf)) }
  | eof { raise (SyntaxError ("String is not terminated")) }

and read_first_char buf = 
  parse
   '''        {raise (SyntaxError ("No char provided"))} (* char is EXACTLY one char no more no less*)
  | '\\' '/'  { Buffer.add_char buf '/'; read_apostrophe buf lexbuf }
  | '\\' '\\' { Buffer.add_char buf '\\'; read_apostrophe buf lexbuf }
  | '\\' 'b'  { Buffer.add_char buf '\b'; read_apostrophe buf lexbuf }
  | '\\' 'f'  { Buffer.add_char buf '\012';read_apostrophe buf lexbuf }
  | '\\' 'n'  { Buffer.add_char buf '\n'; read_apostrophe buf lexbuf }
  | '\\' 'r'  { Buffer.add_char buf '\r'; read_apostrophe buf lexbuf }
  | '\\' 't'  { Buffer.add_char buf '\t'; read_apostrophe buf lexbuf }
  | [^ '\\']  { Buffer.add_char buf (Lexing.lexeme_char lexbuf 0);
                read_apostrophe buf lexbuf }
  | eof       { raise (SyntaxError ("Char is not terminated"))}

and read_apostrophe buf = 
  parse
    '''       {CHARLIT (Buffer.nth buf 0)}
  | _         {raise (SyntaxError ("Extraneous extra chars provided to a char literal"))}

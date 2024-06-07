grammar project;
root: library function (subfunction)*;

library: decstdio(decheader|decdefine)*;

decstdio:'import''_''sapphire';
decheader:'import''_'headertype;
decdefine:'def''_'ID':'(LIT)+;

headertype: ID'_'ID;

function:'@''base'':'block;

block:'{'body'}';


body:
(
expst
|ifst
|loopst
|incremst
|brkst
|inpst
|outst
|funccall
)+
;

expst:expr ;

ifst:'if''('expr')'block('elif''('expr')'block)*('else'block)*;

loopst:('loop''('loopexpr')'block)+ ;

incremst:var increment;

brkst:'br';

inpst:'in'':'var;

outst:'out'':'expr;

funccall: ID(LIT)*'('(var)* (LIT)*')';



expr: expr biop expr
     |expr rop expr
     |expr lop expr
     |'('expr')'
     |MIXER
     |ID
     |LIT;

loopexpr:var '=' term '>>' var '=' term ',' (var increment)*(term)*(var operand '=' LIT)*;

subfunction:'@'ID(LIT)*':'block;


biop: '+' | '-' | '*' | '/';
rop: '=' | '!=' | '>' | '>=' | '<' | '<=' | '==';
lop: '&' | '|';



increment: '++'| '--';

operand: '+=' | '-=';

term: ID | LIT;


var:ID;

ID: [a-zA-Z]+ ;
LIT: [0-9]+ ;
MIXER: [a-zA-Z0-9];

WS: [ \t\r\n]+ -> skip;
.       - Any Character Except New Line <br>
\d      - Digit (0-9) <br>
\D      - Not a Digit (0-9) <br>
\w      - Word Character (a-z, A-Z, 0-9, _) <br>
\W      - Not a Word Character <br>
\s      - Whitespace (space, tab, newline) <br>
\S      - Not Whitespace (space, tab, newline) <br>

\b      - Word Boundary <br>
\B      - Not a Word Boundary <br>
^       - Beginning of a String <br>
$       - End of a String <br>

[]      - Matches Characters in brackets <br>
[^ ]    - Matches Characters NOT in brackets <br>
|       - Either Or <br>
( )     - Group <br>

Quantifiers: <br>
*       - 0 or More <br>
+       - 1 or More <br>
?       - 0 or One <br>
{3}     - Exact Number <br>
{3,4}   - Range of Numbers (Minimum, Maximum) <br>

#### Sample Regexs ####
[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+

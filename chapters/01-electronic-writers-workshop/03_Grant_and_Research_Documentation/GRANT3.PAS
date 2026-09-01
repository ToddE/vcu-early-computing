

{MACON - COULD I BUY SOME OF YOUR TIME?
I need help on this grant - and my main problem is using strings
or, in this case, arrays, and I could use some help - and I'm willing to 
pay for it.

If you have time next week, or anytime, let me know, and I'll come to 
Richmond to meet with you, or I can call you on the phone
or we can conference on the computer.  Start the tab now - if you can help.
THanks
)


program grant3 (input,output, infile, outfile);

{ROugh program to test out my ideas - almost does what I want it to - no 
comments except at top - but it is short and easy to follow - at least I think}
{Todd Emerson

 This is an attempt to write a Standard Pascal Program that can be read by
 the UNIX system - The purpose of the program is to create a prewriting
 that can be used by writing students.

 Step One:  Create a program (or subprogram) that randomly picks an integer
            (counting number) then looks for a word on the random number's
            line.  For example, if there are ten words in a file, and a
            random chooser selects the number 6, look on the sixth line and
            write out the word.

 Step Two:  After spitting out a word, record responses to the words.

}

{Problem ONE - Standard Pascals don't typically use the type string!!!}
{IF VCU does - I'm set - if not - I'm screwed!@}


var
   i,j,k,
   len, lnumber: integer;
   Wrd, name: string;
   infile,outfile: text;
   gottaword: boolean;
   c: string;
   writefile: text;




begin

assign (infile, 'c:\tp\testfile.pas');
reset (infile);

read(lnumber);

for i :=1 to lnumber do readln(infile);
readln(infile, Wrd);
writeln('Type in everything that you know about the subject below');
writeln (Wrd);


assign (outfile, 'c:\tp\rite.pas');
rewrite(outfile);

writeln(outfile, 'Here are your responses to the subject *',Wrd,'*');
writeln(outfile);


writeln('Begin typing on the next line.  When you are finished,');
writeln('go to the next line and type an astericks (*)');

c := ' ';

     while (c <> '*') do
           begin
           readln(c);
           writeln(outfile,c);
           end;

end.

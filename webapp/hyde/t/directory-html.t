<html>
<body>
%apply-x(%
%alias,%(%if-then(%alias%,/)%)%,%
%path,%(%else-then(%path%,%filepath(%input%)%)%)%,%
%pattern,%(%fileextension(%pattern%)%)%,%
%%(<table>
%directory(%path%,,,%(%if(%else(%pattern%,yes)%%equal(%pattern%,%fileextension(%n%)%)%,%
%%(<tr><td><image src="/ccl/xml/hyde/images/%if(%equal(d,%t%)%,folder,file)%.gif"></td>
<td><a href="%alias%%n%">%n%</a></td></tr>
)%)%)%,n,t)%
<table>)%)%
</body>
</html>

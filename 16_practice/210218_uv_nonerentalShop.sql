select n.*
  from uv_nonerentalMember as n
 where n.memberName like '최%'
 order by n.memberName
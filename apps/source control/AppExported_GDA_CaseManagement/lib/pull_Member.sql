select top 1000 MembID, FirstNM, LastNM, DOB, OPT, HPlan, EligDateStart, EligDateEnd 
from ahframdw.ahfhs.dbo.eligibilitycomposite
where
  MembID = coalesce(nullif({{ MemberViewer_MemberID_input.value }}, ''), MembID)
  and FirstNM = coalesce(nullif({{ MemberViewer_FirstName_input.value }}, ''), FirstNM)
  and LastNM = coalesce(nullif({{ MemberViewer_LastName_input.value }}, ''), LastNM)
order by MembID, EligDateStart desc
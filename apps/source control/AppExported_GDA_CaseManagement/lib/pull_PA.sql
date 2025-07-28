select
  fldMemberID
  , fldEQLink
  , fldHSAuthID
  , fldAuthTypeDesc
  , fldBeginDate
  , fldEndDate
  , fldReferringProvID as RefProvID
  , fldReferringProvider as RefProvName
  , fldServicingProvID as ServProvID
  , fldServicingProvider as ServProvName
  , fldRequestStatus
  , x.MemberName
from
  MISCData.dbo.tmpRetoolAuthHeader ah with (nowait)

  outer apply (
	select top 1
		me.FirstNM + ' ' + me.LastNM as MemberName
	from ahfhs.dbo.MemberEligibility me
	where ah.fldMemberID = me.MEMBID
  ) x
where
  left(fldHPlan, 3) = {{ LOB }}
  and (fldMemberID = coalesce(nullif({{ PAViewer_MemberID_input.value }}, ''), fldMemberID)
      and fldHSAuthID = coalesce(nullif({{ PAViewer_HSAuthID_input.value }}, ''), fldHSAuthID))
order by fldBeginDate desc
select
	cs.MemberID
	, cs.ClaimNumber
	, cs.ClaimType
	, cs.ClaimFromDate
	, cs.ClaimToDate
	, cs.BillingProvID
	, cs.BillingProvName
    , e.fldBillingProvContract
	, cs.RenderingProvID
	, cs.RenderingProvName
    , e.fldRenderingProvContract
	, cs.ClaimStatusDesc
    , x.MemberName
    , cs.MASTERBILLED as BillAmount
from
  AHFHS.dbo.Claim_Summary cs with (nowait)
  
  left join AHFHS.dbo.tmpHSClaimExtension e with (nowait)
  on cs.ClaimNumber = e.fldClaimNo

  outer apply (
    select top 1
        me.FirstNM + ' ' + me.LastNM as MemberName
    from AHFHS.dbo.MemberEligibility me with (nowait)
    where cs.MemberID = me.MembID
  ) x
where
  cs.TBLROWID = 1
  and left(cs.[PLAN], 3) = {{ LOB }}
  and (cs.MemberID = coalesce(nullif({{ ClaimViewer_MemberID_input.value }}, ''), cs.MemberID)
       and cs.ClaimNumber = coalesce(nullif({{ ClaimViewer_ClaimNo_input.value }}, ''), cs.ClaimNumber))
order by cs.ClaimFromDate desc
select distinct
  STREET + coalesce(' ' + STREET2, '') + ', ' + CITY + ', ' + STATE + ' ' + left(ZIP, 5) as address
from AHFHS.dbo.Providers
where PROVID = {{ CaseBasicInfo.value.Reference_Provider_ID }}

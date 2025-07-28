function calculateTimeLeft(startdate, timeframe, currentdate) {
  const end_date = new Date(startdate.getTime() + timeframe * 60 * 60 * 1000);
  const time_left = end_date - currentdate;

  const days_left = Math.floor(time_left / (1000 * 60 * 60 * 24));
  const hours_left = Math.floor(
    (time_left % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
  );

  return { days: days_left, hours: hours_left };
}

let startdate = new Date(MilestoneDate);
let currentdate = new Date();

switch (LOB) {
  case "PHP":
    switch (true) {
      case CasePriority == "Expedited":
        if (WOLAOR_req) {
          if (
            ["WOL_Received_Date", "AOR_Received_Date"].includes(MilestoneEvent)
          ) {
            return calculateTimeLeft(
              startdate,
              TimeFrame.CMS_AllAppeal_PlanRecon_Expedited,
              currentdate
            );
          } else if (MilestoneEvent == "Case_Received_Date") {
            return calculateTimeLeft(
              startdate,
              TimeFrame.WOLAOR_Followup,
              currentdate
            );
          } else {
            //return null;
            return { days: "ASAP", hours: "ASAP" };
          }
        } else {
          if (MilestoneEvent == "Case_Received_Date") {
            return calculateTimeLeft(
              startdate,
              TimeFrame.CMS_AllAppeal_PlanRecon_Expedited,
              currentdate
            );
          } else {
            //return null;
            return { days: "ASAP", hours: "ASAP" };
          }
        }

        break;

      case CaseType == "Pre-Service Appeal" && CasePriority == "Standard":
        if (WOLAOR_req) {
          if (
            ["WOL_Received_Date", "AOR_Received_Date"].includes(MilestoneEvent)
          ) {
            return calculateTimeLeft(
              startdate,
              TimeFrame.CMS_PreServiceAppeal_PlanRecon_Standard,
              currentdate
            );
          } else if (MilestoneEvent == "Case_Received_Date") {
            return calculateTimeLeft(
              startdate,
              TimeFrame.WOLAOR_Followup,
              currentdate
            );
          } else {
            //return null;
            return { days: "ASAP", hours: "ASAP" };
          }
        } else {
          if (MilestoneEvent == "Case_Received_Date") {
            return calculateTimeLeft(
              startdate,
              TimeFrame.CMS_PreServiceAppeal_PlanRecon_Standard,
              currentdate
            );
          } else {
            //return null;
            return { days: "ASAP", hours: "ASAP" };
          }
        }

        break;

      case CaseType == "Post-Service Appeal":
        if (WOLAOR_req) {
          if (
            ["WOL_Received_Date", "AOR_Received_Date"].includes(MilestoneEvent)
          ) {
            return calculateTimeLeft(
              startdate,
              TimeFrame.CMS_PostServiceAppeal_PlanRecon_Standard,
              currentdate
            );
          } else if (MilestoneEvent == "Case_Received_Date") {
            return calculateTimeLeft(
              startdate,
              TimeFrame.WOLAOR_Followup,
              currentdate
            );
          } else {
            //return null;
            return { days: "ASAP", hours: "ASAP" };
          }
        } else {
          if (MilestoneEvent == "Case_Received_Date") {
            return calculateTimeLeft(
              startdate,
              TimeFrame.CMS_PostServiceAppeal_PlanRecon_Standard,
              currentdate
            );
          } else {
            //return null;
            return { days: "ASAP", hours: "ASAP" };
          }
        }

        break;

      default:
        return { days: "ASAP", hours: "ASAP" };
    }

    break;

  case "PHC":
    break;

  case "AHF":
    break;
}

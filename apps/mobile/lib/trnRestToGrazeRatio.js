function eucledianAlgorithm(val1, val2)
{
  const result = Number(val1) % Number(val2);

  return (result == 0 ? Number(val2) : eucledianAlgorithm(val2, result));
}

function formatRestToGraze(rest, graze)
{
  rest = Number(rest ?? 0);
  graze = Number(graze ?? 0);

  let gcd = 1;
  if (rest > graze)
    gcd = eucledianAlgorithm(rest, graze);
  else
    gcd = eucledianAlgorithm(graze, rest);

  return `${rest/gcd}:${graze/gcd}`;
}

let data = {{ compile_scorecard.data }};



return `${data.site_rest_to_graze_ratio == undefined ? 'N/A' : formatRestToGraze(data.site_rest_days_per_year, data.site_graze_days_per_year)}`;
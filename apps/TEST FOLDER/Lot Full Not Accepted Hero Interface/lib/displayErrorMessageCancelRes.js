if ( {{cancelReservationAsCredit.data.data.data.errors['0'].messages}} != null ){
  return {{cancelReservationAsCredit.data.data.data.errors['0'].messages}}
} else if ( {{cancelReservationOriginalSource.data.data.data.errors['0'].messages}} != null ){
  return {{cancelReservationOriginalSource.data.data.data.errors['0'].messages}}
}
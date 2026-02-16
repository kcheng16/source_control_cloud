const formatTime = (time) => time;

const data = {
  0: {
    isOpen: switch1.value,
    openTime: formatTime(time8.value),
    closeTime: formatTime(time1.value),
  },
  1: {
    isOpen: switch2.value,
    openTime: formatTime(time9.value),
    closeTime: formatTime(time15.value),
  },
  2: {
    isOpen: switch3.value,
    openTime: formatTime(time10.value),
    closeTime: formatTime(time16.value),
  },
  3: {
    isOpen: switch4.value,
    openTime: formatTime(time11.value),
    closeTime: formatTime(time17.value),
  },
  4: {
    isOpen: switch5.value,
    openTime: formatTime(time12.value),
    closeTime: formatTime(time18.value),
  },
  5: {
    isOpen: switch6.value,
    openTime: formatTime(time13.value),
    closeTime: formatTime(time19.value),
  },
  6: {
    isOpen: switch7.value,
    openTime: formatTime(time14.value),
    closeTime: formatTime(time20.value),
  },
};

openHours.setValue(data);

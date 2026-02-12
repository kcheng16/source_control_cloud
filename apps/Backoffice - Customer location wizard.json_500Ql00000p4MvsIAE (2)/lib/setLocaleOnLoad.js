const savedLanguage = localStorage.values.userLanguage;

if (savedLanguage) {
  utils.changeLocale(savedLanguage);
}

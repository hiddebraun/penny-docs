# Onboarding

- App onthoudt onboarden + registratie status
- Toont login indien al geregistreerd

App slaat onboarding data lokaal op en verstuurt alles bij registratie

## API test data


### Registering a user
```json
{
	"email": "jan@jan.nl",
	"password": "test123!",
	"full_name": "Jan Janssen",
	"language": "nl",
	"onboarding_data": {
		"investment_goals": [
			"retirement"
		],
		"starting_amount": 516000,
		"monthly_amount": 1790,
		"investment_horizon": "short_term",
		"risk_tolerance": "low",
		"income_stability": "irregular",
		"sustainability_focus": "sustainable"
	}
}
```


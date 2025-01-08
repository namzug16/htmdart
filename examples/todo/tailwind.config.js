/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ['lib/src/**/*.dart'],
	theme: {},
	plugins: [
		require('daisyui'),
	],
	daisyui: {
		themes: ["retro"],
	},
}

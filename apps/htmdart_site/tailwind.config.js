/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ['lib/**/*.dart'],
	plugins: [
    require('@tailwindcss/typography'),
		require('daisyui'),
	],
  daisyui: {
    themes: [
      {
        htmdart: {
          "primary": "#2b5b97",
          "secondary": "#2b5b97",
          "accent": "#fbbf24",
          "neutral": "#1c1917",
          "base-100": "#111827",
          "info": "#0095eb",
          "success": "#00cba6",
          "warning": "#fef08a",
          "error": "#ff707e",
        }
      }
    ],
  },
}

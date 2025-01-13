_: tailwind run

generate:
	dart run build_runner build --delete-conflicting-outputs

tailwind:
	npx tailwindcss -i tailwind.css -o public/index.css --minify

run: 
	dart run bin/server.dart

.DEFAULT_GOAL := _

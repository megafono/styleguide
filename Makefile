define generate_logo
	sed 's/{project_name}/$(1)/' src/megafono-v1-project.svg > generated/megafono-v1-$(2).svg
endef

define generate_png
	inkscape -z -e compiled/megafono-$(1)-$(2)x$(3).png -w $(2) -h $(3) generated/megafono-$(1).svg
endef

default: optimize clean generate_project_svg compiled/megafono-v1-3000x3000.png
	$(call generate_png,v1-changelog,3000,3000)
	$(call generate_png,v1-express,3000,3000)
	$(call generate_png,v1-site,3000,3000)
	$(call generate_png,v1-o-duke,3000,3000)

generate_project_svg:
	$(call generate_logo,Changelog,changelog)
	$(call generate_logo,Express,express)
	$(call generate_logo,Network,network)
	$(call generate_logo,Site,site)
	$(call generate_logo,O Duke,o-duke)

optimize:
	svgo --pretty src/megafono-v1.svg
	svgo --pretty src/megafono-v1-project.svg

clean:
	@rm -Rf compiled
	@rm -Rf generated
	@mkdir -p compiled
	@mkdir -p generated

compiled/megafono-v1-3000x3000.png:
	inkscape -z -e compiled/megafono-v1-3000x3000.png -w 3000 -h 3000 src/megafono-v1.svg

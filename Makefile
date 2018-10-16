define generate_logo
  sed 's/{project_name}/$(1)/' src/megafono-v1-project.svg | sed 's/{background}/#FFF/' | sed 's/{foreground}/#0e2430/' > generated/megafono-v1-l-$(2).svg
	sed 's/{project_name}/$(1)/' src/megafono-v1-project.svg | sed 's/{background}/#0e2430/' | sed 's/{foreground}/#FFF/' > generated/megafono-v1-d-$(2).svg
	inkscape -z -e compiled/megafono-v1-l-$(2)-$(3)x$(4).png -w $(3) -h $(4) generated/megafono-v1-l-$(2).svg
	inkscape -z -e compiled/megafono-v1-d-$(2)-$(3)x$(4).png -w $(3) -h $(4) generated/megafono-v1-d-$(2).svg
endef

default: optimize clean compiled/megafono-v1-3000x3000.png
	$(call generate_logo,Changelog,changelog,3000,3000)
	$(call generate_logo,Express,express,3000,3000)
	$(call generate_logo,Network,network,3000,3000)
	$(call generate_logo,Site,site,3000,3000)
	$(call generate_logo,O Duke,o-duke,3000,3000)

optimize:
	svgo --pretty src/megafono-v1.svg
	svgo --pretty src/megafono-v1-project.svg

clean:
	@rm -Rf compiled
	@rm -Rf generated
	@mkdir -p compiled
	@mkdir -p generated

compiled/megafono-v1-3000x3000.png:
	sed 's/{background}/#FFF/' src/megafono-v1.svg | sed 's/{foreground}/#0e2430/' > generated/megafono-v1-l.svg
	sed 's/{background}/#0e2430/' src/megafono-v1.svg | sed 's/{foreground}/#FFF/' > generated/megafono-v1-d.svg
	inkscape -z -e compiled/megafono-v1-l-3000x3000.png -w 3000 -h 3000 generated/megafono-v1-l.svg
	inkscape -z -e compiled/megafono-v1-d-3000x3000.png -w 3000 -h 3000 generated/megafono-v1-d.svg

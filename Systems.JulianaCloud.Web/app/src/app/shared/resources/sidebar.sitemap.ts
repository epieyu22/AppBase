export default [
    {
      path: "/dashboards/dashboard",
      title: "Dashboard",
      type: "link",
      icontype: "ni ni-shop text-primary"
    },
    {
      path: "/novelties",
      title: "Novedades",
      type: "sub",
      icontype: "las la-newspaper text-orange",
      collapse: "examples",
      isCollapsed: true,
      children: [
        { path: "manager", title: "Manager", type: "link" },
        // { path: "login", title: "Salarios", type: "link" },
        // { path: "register", title: "Ocasionales", type: "link" },
        // { path: "lock", title: "Permanente", type: "link" },
        // { path: "timeline", title: "Timeline", type: "link" },
        // { path: "profile", title: "Profile", type: "link" }
      ]
    },
    // {
    //   path: "/components",
    //   title: "Components",
    //   type: "sub",
    //   icontype: "ni-ui-04 text-info",
    //   collapse: "components",
    //   isCollapsed: true,
    //   children: [
    //     { path: "buttons", title: "Buttons", type: "link" },
    //     { path: "cards", title: "Cards", type: "link" },
    //     { path: "grid", title: "Grid", type: "link" },
    //     { path: "notifications", title: "Notifications", type: "link" },
    //     { path: "icons", title: "Icons", type: "link" },
    //     { path: "typography", title: "Typography", type: "link" },
    //     {
    //       path: "multilevel",
    //       isCollapsed: true,
    //       title: "Multilevel",
    //       type: "sub",
    //       collapse: "multilevel",
    //       children: [
    //         { title: "Third level menu" },
    //         { title: "Just another link" },
    //         { title: "One last link" }
    //       ]
    //     }
    //   ]
    // },
    // {
    //   path: "/forms",
    //   title: "Forms",
    //   type: "sub",
    //   icontype: "ni-single-copy-04 text-pink",
    //   collapse: "forms",
    //   isCollapsed: true,
    //   children: [
    //     { path: "elements", title: "Elements", type: "link" },
    //     { path: "components", title: "Components", type: "link" },
    //     { path: "validation", title: "Validation", type: "link" }
    //   ]
    // },
    // {
    //   path: "/tables",
    //   title: "Tables",
    //   type: "sub",
    //   icontype: "ni-align-left-2 text-default",
    //   collapse: "tables",
    //   isCollapsed: true,
    //   children: [
    //     { path: "tables", title: "Tables", type: "link" },
    //     { path: "sortable", title: "Sortable", type: "link" },
    //     { path: "ngx-datatable", title: "Ngx Datatable", type: "link" }
    //   ]
    // },
    // {
    //   path: "/maps",
    //   title: "Maps",
    //   type: "sub",
    //   icontype: "ni-map-big text-primary",
    //   collapse: "maps",
    //   isCollapsed: true,
    //   children: [
    //     { path: "google", title: "Google Maps", type: "link" },
    //     { path: "vector", title: "Vector Map", type: "link" }
    //   ]
    // },
    // {
    //   path: "/widgets",
    //   title: "Widgets",
    //   type: "link",
    //   icontype: "ni-archive-2 text-green"
    // },
    // {
    //   path: "/charts",
    //   title: "Charts",
    //   type: "link",
    //   icontype: "ni-chart-pie-35 text-info"
    // },
    // {
    //   path: "/calendar",
    //   title: "Calendar",
    //   type: "link",
    //   icontype: "ni-calendar-grid-58 text-red"
    // }
  ]
#r "C:\Program Files\workspacer\workspacer.Shared.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.TitleBar\workspacer.TitleBar.dll"

using System;
using System.Collections.Generic;
using System.Linq;
using workspacer;
using workspacer.Bar;
using workspacer.Bar.Widgets;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;
using workspacer.TitleBar;



Action<IConfigContext> doConfig = (context) =>
{
    /* Bar */
    context.AddBar(new BarPluginConfig()
    {
        FontSize = 10,
        BarHeight = 20,
        FontName = "CaskaydiaCove NF",
        LeftWidgets = () => new IBarWidget[]
        {
            new WorkspaceWidget(),
            new TextWidget(": "),
            new TitleWidget() { IsShortTitle = true }
        },
        RightWidgets = () => new IBarWidget[]
        {
            new BatteryWidget(),
            new TimeWidget(1000, "HH:mm dd-MMM-yyyy"),
        }
    });
    
    string sys = "  ";
    string dev = "  "; 
    string search = " ﰍ ";
    string chat = "  ";
    string rand = " יּ ";
    string bg = "  ";

    context.DefaultLayouts = () => new ILayoutEngine[]
    {
        new TallLayoutEngine(),
        new FullLayoutEngine(),
    };
    context.WorkspaceContainer.CreateWorkspaces(sys, dev, search, chat, rand, bg);
    
    /* Filters */
    string[] filter_targets = {"PanGPA.exe", "procexp64.exe"};
    foreach(string filter_target in filter_targets)
    {
        context.WindowRouter.AddFilter((window) => !window.ProcessFileName.Equals(filter_target));
    };

    /* Routes */
    context.WindowRouter.RouteTitle("Webex", chat);
    
    /* Hotkeys */
    KeyModifiers leader = KeyModifiers.Control;
    KeyModifiers superLeader = KeyModifiers.Alt | KeyModifiers.Control;
    context.Keybinds.Subscribe(superLeader, Keys.D1, () => context.Workspaces.MoveFocusedWindowToWorkspace(0));
    context.Keybinds.Subscribe(superLeader, Keys.D2, () => context.Workspaces.MoveFocusedWindowToWorkspace(1));
    context.Keybinds.Subscribe(superLeader, Keys.D3, () => context.Workspaces.MoveFocusedWindowToWorkspace(2));
    context.Keybinds.Subscribe(superLeader, Keys.D4, () => context.Workspaces.MoveFocusedWindowToWorkspace(3));
    context.Keybinds.Subscribe(superLeader, Keys.D5, () => context.Workspaces.MoveFocusedWindowToWorkspace(4));
    context.Keybinds.Subscribe(superLeader, Keys.D6, () => context.Workspaces.MoveFocusedWindowToWorkspace(5));
    
    context.Keybinds.Subscribe(leader, Keys.D1, () => context.Workspaces.SwitchToWorkspace(0));
    context.Keybinds.Subscribe(leader, Keys.D2, () => context.Workspaces.SwitchToWorkspace(1));
    context.Keybinds.Subscribe(leader, Keys.D3, () => context.Workspaces.SwitchToWorkspace(2));
    context.Keybinds.Subscribe(leader, Keys.D4, () => context.Workspaces.SwitchToWorkspace(3));
    context.Keybinds.Subscribe(leader, Keys.D5, () => context.Workspaces.SwitchToWorkspace(4));
    context.Keybinds.Subscribe(leader, Keys.D6, () => context.Workspaces.SwitchToWorkspace(5));
    
	context.Keybinds.Subscribe(leader, Keys.Q, () => context.Workspaces.FocusedWorkspace.SwapFocusAndNextWindow());
    context.Keybinds.Subscribe(leader, Keys.W, () => context.Workspaces.FocusedWorkspace.ShrinkPrimaryArea());
    context.Keybinds.Subscribe(leader, Keys.E, () => context.Workspaces.FocusedWorkspace.ExpandPrimaryArea());
    
    context.Keybinds.Subscribe(leader, Keys.A, () => context.Workspaces.FocusedWorkspace.NextLayoutEngine());
    context.Keybinds.Subscribe(leader, Keys.D, () => context.Workspaces.FocusedWorkspace.FocusNextWindow());
    context.Keybinds.Subscribe(leader, Keys.S, () => context.Workspaces.FocusedWorkspace.FocusPreviousWindow());

};
return doConfig;

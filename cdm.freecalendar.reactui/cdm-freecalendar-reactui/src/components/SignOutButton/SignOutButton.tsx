import React from "react";
import { useMsal } from "@azure/msal-react";

function handleLogout(instance: any) {
    instance.logoutRedirect().catch((e: any) => {
        console.error(e);
    });
}

/**
 * Renders a button which, when selected, will redirect the page to the logout prompt
 */
export const SignOutButton = () => {
    const { instance } = useMsal();

    return (
        <button className="btn btn-secondary" onClick={() => handleLogout(instance)}>Sign out using Redirect</button>
    );
}
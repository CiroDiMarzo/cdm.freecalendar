import { useIsAuthenticated, useMsal } from "@azure/msal-react";

export const DisplayNameLabel = () => {
    const isAuthenticated = useIsAuthenticated();
    const { accounts } = useMsal();
    return (
        (isAuthenticated ? <div>Hello {accounts[0].name}</div> : null)
    )
}
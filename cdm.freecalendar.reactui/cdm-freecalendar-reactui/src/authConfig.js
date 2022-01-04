export const msalConfig = {
    auth: {
      clientId: "ef406970-2fc9-4ae3-b0cf-f8d540057650",
      authority: "https://login.microsoftonline.com/eeda3699-e998-4e9f-b4c4-1f36f40b9857",
      redirectUri: "http://localhost:3000/",
    },
    cache: {
      cacheLocation: "sessionStorage", // This configures where your cache will be stored
      storeAuthStateInCookie: false, // Set this to "true" if you are having issues on IE11 or Edge
    }
  };
  
  export const loginRequest = {
   scopes: ["User.Read"]
  };
  
  export const tokenRequest = {
    scopes: []
  };
// import { serve } from "https://deno.land/std@0.131.0/http/server.ts"; 
import "./main.dart.js";

Deno.serve(async (request) => {
  if (self.server_universeDartSupabaseFetchHandler) {
    return self.server_universeDartSupabaseFetchHandler(request);
  }

  return new Response("Something went wrong", { status: 500 });
});

declare global {
  interface Window {
    server_universeDartSupabaseFetchHandler?: (request: Request) => Promise<Response>;
  }
}


//
//  SupabaseAuth.swift
//  Esame
//
//  Created by user243601 on 10/17/23.
//
import Foundation
import Combine
import Supabase


class SupabaseAuth: ObservableObject {
    
    let client = SupabaseClient(supabaseURL: URL(string: "xxxxxxx")!, supabaseKey: "xxxxxxx")
       
    
    func LoginUser() async throws {
        do{
            let session = try await client.auth.session
            
        }catch let error{
            throw error
        }
    }
    
    func getUserId() async -> UUID? {
        do {
            let session = try await client.auth.session
            return session.user.id
        } catch {
            // Handle any errors that may occur while getting the user ID.
            return nil
        }
    }

    
    
    func SignIn(email:String,password:String) async throws {
        do{
            try await client.auth.signIn(email: email.lowercased(), password: password)
        }catch let error{
            throw error
        }
    }
    
    
    func SignUp(email:String,password:String) async throws{
        do{
            try await client.auth.signUp( email: email.lowercased(), password: password)
        }catch let error{
            throw error
        }
    }
    
    func signOut() async throws{
        do{
            try await client.auth.signOut()
        }catch let error{
            throw error
        }
    }
}

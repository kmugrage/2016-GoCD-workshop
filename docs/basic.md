# SSH Key Setup

There can be many nuances to setting up SSH keys. These instructions intentionally cover only enough detail for the GoCD Workshop.

### Use an existing key

If you already have an existing SSH key it's easiest to use that one. To see if you have one, open a terminal and type `ls -l ~/.ssh`. If you have an existing key you should see two files with the same name, one of which has a .pub extension. For example, on my system it's...

```
sample@ubuntu-xenial:~$ ls -l ~/.ssh/
total 8
-rw------- 1 sample sample 1675 Mar  1 20:26 id_rsa
-rw-r--r-- 1 sample sample  402 Mar  1 20:26 id_rsa.pub
```

The file without the extension is your private key. You should protect this at least as much as you'd protect your most important passwords. The file that ends with .pub is the public key. This one gets installed on the system you're connecting to.

### Create a new key

To create a new key on Linux or Mac open a terminal prompt at type `ssh-keygen`. For our purposes, you can just press `return` for each prompt. Creating a passphrase will make it considerably more secure, but you will have to enter it each time you connect to the remote machine.

```
sample@ubuntu-xenial:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/sample/.ssh/id_rsa):
Created directory '/home/sample/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/sample/.ssh/id_rsa.
Your public key has been saved in /home/sample/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:dXJbfxBZiF8TZ9MVOS034vWGE2BhV2YC8YcqmckkKQc sample@ubuntu-xenial
The key's randomart image is:
+---[RSA 2048]----+
|      E     B*+O/|
|       . . o.+=&B|
|      . + + +.B**|
|       o = B =++o|
|        S * o  oo|
|           .    .|
|                 |
|                 |
|                 |
+----[SHA256]-----+
sample@ubuntu-xenial:~$
```
```
sample@ubuntu-xenial:~$ ls -l ~/.ssh/
total 8
-rw------- 1 sample sample 1675 Mar  1 20:26 id_rsa
-rw-r--r-- 1 sample sample  402 Mar  1 20:26 id_rsa.pub
```

### Adding the key to Digital Ocean

You're going to need to copy and paste the contents of the .pub file into Digital Ocean.

1. Begin by typing `cat ~/.ssh/id_rsa.pub`.

You should see something like...

```
sample@ubuntu-xenial:~$ cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/mALflyDWBc9tVfT9RP4+sdfK1qY+iapcYjDjfWMvsmg
LnoP0tyKKM/Xc1WkzM1qqhnTsfLaUqZBOswOAaJGv8Cqk5anAqNsQ0YDK6NIynvKKq7rSBYQD+P
oTGOBxIQhF53C0Eqhq0dtrXjZz0tJyhuGl9L/tukdzDxBqw5nHzSc0yb9wnVeZeyIaul+QMZM+K
hmznEsKzEwEEahAfR1kYnphM1j+ez8A1qsmKMsVmXe7epgMcfFOFvHvNYuifRv/XnDCA/sFWOvO
4r23xOQFMC3Iaec2Ih7noq8FTuPct7IpqOZFpHR7NoYNPgGaMUv5b7Jvi7k2EcJ7/vzIujWN sample@ubuntu-xenial
sample@ubuntu-xenial:~$
```

2. Copy the entire string.

3. Navigate to [https://cloud.digitalocean.com/settings/security](https://cloud.digitalocean.com/settings/security)

4. Click on the button that says `Add SSH Key`

5. Paste your public key into the box

6. Name the key `GoCD Workshop` - Note: It's important that you use this case sensitive name in order for our later Vagrant automation to work correctly.

[Return to the GoCD Workshop setup](README.md)

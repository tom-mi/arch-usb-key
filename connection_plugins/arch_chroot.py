from ansible.plugins.connection.chroot import Connection as ChrootConnection
import distutils


__metaclass__ = type


class Connection(ChrootConnection):

    def __init__(self, play_context, new_stdin, *args, **kwargs):
        super(Connection, self).__init__(play_context, new_stdin, *args, **kwargs)

        self.chroot_cmd = distutils.spawn.find_executable('arch-chroot')
        if not self.chroot_cmd:
            raise AnsibleError('arch-chroot command not found in PATH')
